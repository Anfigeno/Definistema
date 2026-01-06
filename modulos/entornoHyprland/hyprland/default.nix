{ usuario, pkgs, ... }:
{
  nombre = "hyprland";
  configuracion = {
    home-manager.users.${usuario} = {
      wayland.windowManager.hyprland = {
        systemd.enable = false;
        enable = true;
      };

      home.packages = with pkgs; [ xdg-utils ];
    };

    programs.hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };

    hardware.graphics.enable = true;
  };
}
