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
        settings = {
          "$mod" = "SUPER";
          input = {
            kb_layout = "latam";
            sensitivity = -0.6;
            scroll_factor = 0.8;
            touchpad = {
              natural_scroll = true;
            };
          };
          decoration = {
            rounding = 8;

            shadow = {
              enabled = true;
              range = 40;
              offset = "0, 0";
              render_power = 3;
              color = "rgba(00000080)";
              color_inactive = "rgba(00000055)";
            };

            blur = {
              enabled = true;
              size = 6;
              passes = 3;
              new_optimizations = true;
              ignore_opacity = true;
            };

            bezier = [
              "easeInOutQuart, 0.76, 0, 0.24, 1"
              "easeOutQuart, 0.25, 1, 0.5, 1"
            ];

            # animation = [
            #   "windows, 1, 5, easeInOutQuart, slide"
            #   "border, 1, 5, easeOutQuart"
            #   "fade, 1, 5, easeOutQuart"
            #   "workspaces, 1, 3, easeInOutQuart, slidevert"
            # ];
          };
          general = {
            layout = "hy3";
            gaps_in = 4;
            gaps_out = 4;
            border_size = 1;
          };
          group = {
            auto_group = true;
            groupbar = {
              enabled = true;
              height = 30;
              indicator_height = 0;
              gradients = true;
              font_family = "Iosevka";
              font_size = 13;
              render_titles = true;
              scrolling = true;
              rounding = 0;
              gradient_rounding = 0;
              gaps_in = 0;
              gaps_out = 0;
              keep_upper_gap = false;
            };
          };
          plugin.hy3 = {
            group_inset = 0;
            tabs =
              let
                f = cadena: "rgb(${builtins.substring 1 (-1) cadena})";
                cfgHpyrland =
                  config.home-manager.users.${usuario}.wayland.windowManager.hyprland.settings.group.groupbar;
              in
              with inputs.mestizo256nix.paletas.mestizo;
              {
                height = 32;
                radius = 8;
                border_width = 0;
                text_font = "Iosevka";
                text_height = 10;

                "col.active" = cfgHpyrland."col.active";
                "col.active.border" = cfgHpyrland."col.active";
                "col.active.text" = f color16;

                "col.inactive" = cfgHpyrland."col.inactive";
                "col.inactive.border" = cfgHpyrland."col.inactive";
                "col.inactive.text" = cfgHpyrland.text_color;

                "col.focused" = cfgHpyrland."col.inactive";
                "col.focused.border" = cfgHpyrland."col.inactive";
                "col.focused.text" = cfgHpyrland.text_color;

                "col.locked" = cfgHpyrland."col.locked_inactive";
                "col.locked.border" = cfgHpyrland."col.locked_inactive";
                "col.locked.text" = f color16;
              };
          };
          bind = import ./atajosDeTeclado { inherit pkgs lib; };
          bindm = import ./atajosDelMouse.nix;
          windowrule = import ./reglasDeVentanas.nix { inherit config; };
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
