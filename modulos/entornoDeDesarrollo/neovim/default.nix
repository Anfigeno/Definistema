{
  usuario,
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.definistema;
in

{
  imports = [
    ./integraciones
  ];

  options.definistema.entornoDeDesarrollo.neovim = {
    activar = lib.mkEnableOption "Activa el módulo de neovim";
  };

  config = lib.mkIf cfg.entornoDeDesarrollo.neovim.activar {
    home-manager.users.${usuario}.programs.neovim =
      let
        complementos = import ./complementos { inherit pkgs lib; };

        dependenciasDeSistemaDeComplementos = lib.lists.flatten (
          map (complemento: complemento.dependenciasDeSistema or [ ]) complementos
        );

        paquetesExtra = import ./paquetesExtra.nix { inherit pkgs; };
      in

      {

        enable = true;
        defaultEditor = true;
        extraLuaConfig = import ./init.lua.nix { inherit pkgs; };
        extraPackages = dependenciasDeSistemaDeComplementos ++ paquetesExtra;
        plugins = [ (import ./lazy.nix { inherit pkgs complementos; }) ];
      };
  };
}
