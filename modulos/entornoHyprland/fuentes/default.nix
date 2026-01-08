{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.home.packages = with pkgs; [
    nerd-fonts.iosevka
    iosevka
    monaspace
    ubuntu-classic
    noto-fonts-color-emoji
    noto-fonts
    google-fonts
    dejavu_fonts
    liberation_ttf
  ];
}
