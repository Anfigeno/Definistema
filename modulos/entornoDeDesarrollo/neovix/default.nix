{
  usuario,
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.definistema.entornoDeDesarrollo.neovix;
in
{
  imports = [
    ./integraciones
    ./complementos
    ./lsps.nix
    ./lenguajes.nix
    ./formateadores.nix
    ./entornosDeEjecucion.nix
  ];

  options.definistema.entornoDeDesarrollo.neovix = {
    activar = lib.mkEnableOption "Activa el módulo de neovix";
  };

  config = lib.mkIf cfg.activar {
    home-manager.users.${usuario}.programs.neovix = {
      activar = true;
      editorPorDefecto = true;
      configuracion = import ./configuracion.nix { inherit pkgs; };
    };
  };
}
