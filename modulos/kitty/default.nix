{
  pkgs,
  usuario,
  lib,
  inputs,
  config,
  ...
}:
let
  cfg = config.definistema;
in
{
  options.definistema.kitty = {
    activar = lib.mkEnableOption "Activa el módulo de kitty";
  };

  config = lib.mkIf cfg.kitty.activar {
    home-manager.users.${usuario} = {
      home.packages = with pkgs; [
        nerd-fonts.iosevka
        iosevka
      ];

      programs.kitty = {
        enable = true;
        settings = lib.recursiveUpdate inputs.mestizo-nix.integraciones.kitty {
          font_family = "Iosevka Nerd Font";
          bold_font = "Iosevka Bold";
          italic_font = "Iosevka Italic";
          bold_italic_font = "Iosevka Nerd Bold Italic";

          shell = "${pkgs.fish}/bin/fish";

          disable_ligatures = "never";
          font_size = 10.5;
          font_features = ''
            +calt
          '';

          window_padding_width = 6;

          modify_font = ''
            cell_height 6px
          '';

          confirm_os_window_close = 0;
          hide_window_decorations = true;

          tab_bar_style = "separator";
          tab_separator = ".";

          tab_title_template = " {index}・{title} ";

          map = ''
            ctrl+shift+t new_tab_with_cwd
            map ctrl+shift+enter launch --cwd=current'';

          cursor_trail = 1;
          cursor_trail_decay = "0.1 0.4";

          allow_remote_control = true;
          box_drawing_scale = "0.001, 0.1, 1.5, 2";
        };
      };
    };
  };
}
