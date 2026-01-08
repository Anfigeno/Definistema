{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      name = "gtk2";
      package = pkgs.kdePackages.breeze-gtk;
    };
  };
}
