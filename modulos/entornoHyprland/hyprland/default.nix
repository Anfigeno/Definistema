{
  usuario,
  pkgs,
  lib,
  ...
}:
{
  nombre = "hyprland";
  configuracion = {
    home-manager.users.${usuario} = {
      wayland.windowManager.hyprland = {
        systemd.variables = [ "-all" ];
        enable = true;
        settings = {
          "$mod" = "SUPER";
          bind = import ./atajosDeTeclado { inherit pkgs lib; };
          bindm = import ./atajosDelMouse.nix;
          input = import ./entrada.nix;
        };
      };

      home.packages = with pkgs; [
        xdg-utils
        kitty
      ];
    };

    programs.hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };

    hardware.graphics.enable = true;
  };
}
