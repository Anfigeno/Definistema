{
  usuario,
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
let
  cfg = config.entornoDeDesarrollo;
  activar = cfg.activar || cfg.cliphist.activar;
in
{
  options.entornoDeDesarrollo.cliphist = {
    activar = lib.mkEnableOption "Activa el módulo de cliphist";
  };

  config = lib.mkIf activar {
    home-manager.users.${usuario} = {
      services.cliphist = {
        enable = true;
        allowImages = true;
      };
    };
  };
}
