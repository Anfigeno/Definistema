{
  pkgs,
  config,
  lib,
  usuario,
  ...
}:
let
  cfg = config.definistema;
in
{
  config = lib.mkIf cfg.entornoHyprland.activar {
    home-manager.users.${usuario}.xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
      ];
      config.common.default = [ "hyrpland" ];
    };
  };
}
