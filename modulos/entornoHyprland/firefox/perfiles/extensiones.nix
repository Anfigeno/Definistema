{ pkgs, ... }:
{
  packages = with pkgs.firefox-addons; [
    stylus
    ublock-origin
    languagetool
  ];
}
