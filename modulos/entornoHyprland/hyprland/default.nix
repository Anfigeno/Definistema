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
  options.definistema.entornoHyprland.hyprland = {
    activar = lib.mkEnableOption "Activa el módulo de hyprland";
  };

  config = lib.mkIf cfg.entornoHyprland.hyprland.activar {
    home-manager.users.${usuario} = {
      wayland.windowManager.hyprland = {
        systemd.variables = [ "--all" ];
        enable = true;
        plugins = with pkgs.hyprlandPlugins; [ hy3 ];
        settings = lib.recursiveUpdate inputs.mestizo-nix.integraciones.hyprland {
          "$mod" = "SUPER";
          bind = import ./atajosDeTeclado { inherit pkgs lib; };
          bindm = import ./atajosDelMouse.nix;
          input = import ./entrada.nix;
          decoration = import ./decoracion.nix;
          general = import ./general.nix;
          group = import ./grupo.nix;
          windowrule = import ./reglasDeVentanas.nix { inherit config; };
          plugin = {
            hy3 = {
              group_inset = 0;
            };
          };
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
