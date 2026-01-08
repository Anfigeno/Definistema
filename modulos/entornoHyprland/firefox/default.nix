{
  usuario,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  home-manager.users.${usuario}.programs.firefox = {
    enable = true;
    package = (pkgs.wrapFirefox (pkgs.firefox-unwrapped.override { pipewireSupport = true; }) { });
    profiles = import ./perfiles { inherit lib inputs pkgs; };
    languagePacks = [
      "es-MX"
      "es-ES"
    ];
  };
}
