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
  options.definistema.udiskie = {
    activar = lib.mkEnableOption "Activa el módulo de udiskie";
  };

  config = lib.mkIf cfg.udiskie.activar {
    services.udisks2.enable = true;

    home-manager.users.${usuario}.services.udiskie = {
      enable = true;
      automount = true;
      tray = "auto";
    };
  };
}
