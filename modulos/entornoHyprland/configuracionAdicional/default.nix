{ usuario, pkgs, ... }:
{
  definistema = {
    xdg.activar = true;
    gtk.activar = true;
    qt.activar = true;
    pipewire.activar = true;
    kitty.activar = true;
  };

  home-manager.users.${usuario} = {
    home.packages = with pkgs; [
      nautilus
      feh
      mpv
      amberol
    ];

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
      ];
      config.common.default = [ "hyrpland" ];
    };
  };
}
