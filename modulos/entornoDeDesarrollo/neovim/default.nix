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
        conComplementos = clave: respaldo: map (complemento: complemento.${clave} or respaldo) complementos;

        dependenciasDeSistema = lib.lists.flatten (conComplementos "dependenciasDeSistema" [ ]);
        dependenciasDeLua = lib.lists.flatten (conComplementos "dependenciasDeLua" [ ]);

        paquetesExtra = import ./paquetesExtra.nix { inherit pkgs; };
      in

      {

        enable = true;
        defaultEditor = true;
        extraLuaConfig = import ./init.lua.nix { inherit pkgs; };
        extraPackages = dependenciasDeSistema ++ paquetesExtra;
        extraLuaPackages = ps: map (nombre: ps.${nombre}) dependenciasDeLua;
        plugins = [ (import ./lazy.nix { inherit pkgs complementos; }) ];
      };
  };
}
