{ pkgs, usuario, ... }:
{
  nombre = "gtk";
  configuracion = {
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
