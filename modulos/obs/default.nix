{
  lib,
  config,
  usuario,
  ...
}:
let
  cfg = config.definistema;
in
{
  options.definistema.obs = {
    activar = lib.mkEnableOption "Activa el módulo de obs";
  };

  config = lib.mkIf cfg.obs.activar {
    home-manager.users.${usuario}.programs.obs-studio.enable = true;
  };
}
