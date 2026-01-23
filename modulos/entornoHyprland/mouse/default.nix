{
  lib,
  config,
  usuario,
  pkgs,
  ...
}:
let
  cfg = config.definistema.entornoHyprland.mouse;
in
{
  options.definistema.entornoHyprland.mouse = {
    activar = lib.mkEnableOption "Activa el módulo de mouse";
  };

  config = lib.mkIf cfg.activar {
    home-manager.users.${usuario}.home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Amber";
      size = 16;
    };
  };
}
