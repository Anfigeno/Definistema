{
  pkgs,
  usuario,
  config,
  lib,
  ...
}:
let
  cfg = config.definistema;
in
{
  options.definistema.fontconfig = {
    activar = lib.mkEnableOption "Activa el módulo de fontconfig";
  };

  config = lib.mkIf cfg.gtk.activar {
    home-manager.users.${usuario} = {
      home.packages = with pkgs; [
        iosevka
        nerd-fonts.iosevka
        ubuntu-classic
        noto-fonts-color-emoji
        noto-fonts
        google-fonts
        dejavu_fonts
        liberation_ttf
      ];

      fonts.fontconfig = {
        antialiasing = true;
        defaultFonts = {
          monospace = [ "Iosevka" ];
          sansSerif = [ "Iosevka" ];
          serif = [ "Iosevka" ];
          emoji = [ "Noto Color Emoji" ];
        };
      };
    };
  };
}
