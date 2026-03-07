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
  options.definistema.entornoHyprland.wl-clip-persist = {
    activar = lib.mkEnableOption "Activa el módulo de wl-clip-persist";
  };

  config = lib.mkIf cfg.entornoHyprland.wl-clip-persist.activar {
    home-manager.users.${usuario}.services.wl-clip-persist.enable = true;
  };
}
