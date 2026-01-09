{
  usuario,
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
let
  cfg = config.definistema;
in
{
  config = lib.mkIf cfg.entornoHyprland.activar {
    home-manager.users.${usuario} = {
      wayland.windowManager.hyprland = {
        systemd.variables = [ "--all" ];
        enable = true;
        settings = lib.recursiveUpdate inputs.mestizo-nix.integraciones.hyprland {
          "$mod" = "SUPER";
          bind = import ./atajosDeTeclado { inherit pkgs lib; };
          bindm = import ./atajosDelMouse.nix;
          input = import ./entrada.nix;
          decoration = import ./decoracion.nix;
          general = import ./general.nix;
          group = import ./grupo.nix;
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
