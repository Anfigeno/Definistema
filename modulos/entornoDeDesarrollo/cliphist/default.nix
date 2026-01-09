{
  usuario,
  config,
  lib,
  ...
}:
let
  cfg = config.definistema;
in
{
  options.definistema.entornoDeDesarrollo.cliphist = {
    activar = lib.mkEnableOption "Activa el módulo de cliphist";
  };

  config = lib.mkIf cfg.entornoDeDesarrollo.cliphist.activar {
    home-manager.users.${usuario}.services.cliphist = {
      enable = true;
      allowImages = true;
    };
  };
}
