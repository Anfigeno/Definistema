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
  options.definistema.gtk = {
    activar = lib.mkEnableOption "Activa el módulo de gtk";
  };

  config = lib.mkIf cfg.gtk.activar {
    home-manager.users.${usuario}.gtk = {
      enable = true;

      font = {
        name = "Iosevka";
        package = pkgs.iosevka;
      };

      theme = {
        name = "Orchis-Red-Light";
        package = pkgs.orchis-theme;
      };

      iconTheme = {
        name = "Reversal";
        package = pkgs.reversal-icon-theme;
      };

      cursorTheme = {
        name = "Bibata-Modern-Amber";
        package = pkgs.bibata-cursors;
      };
    };
  };
}
