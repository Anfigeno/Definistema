{
  usuario,
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

  options.definistema.swww = {
    activar = lib.mkEnableOption "Activa el módulo de swww";
  };

  config = lib.mkIf cfg.swww.activar {
    home-manager.users.${usuario}.services.swww.enable = true;

  };
}
