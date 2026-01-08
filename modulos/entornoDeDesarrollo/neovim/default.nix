{
  usuario,
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.entornoDeDesarrollo;
  activar = cfg.activar || cfg.neovim.activar;
in
{
  options.entornoDeDesarrollo.neovim = {
    activar = lib.mkEnableOption "Activa el módulo de neovim";
  };

  config = lib.mkIf activar {

    home-manager.users.${usuario} =
      { ... }:
      {
        imports = [
          ./integraciones/xdg.nix
          ./integraciones/hyprland.nix
        ];

        programs.neovim =
          let
            complementos = import ./complementos { inherit pkgs lib; };

            dependenciasDeSistemaDeComplementos = lib.lists.flatten (
              map (complemento: complemento.dependenciasDeSistema or [ ]) complementos
            );
          in
          {
            enable = true;
            defaultEditor = true;
            extraLuaConfig = import ./init.lua.nix { inherit pkgs; };
            extraPackages = dependenciasDeSistemaDeComplementos;
            plugins = [ (import ./lazy.nix { inherit pkgs complementos; }) ];
          };
      };
  };
}
