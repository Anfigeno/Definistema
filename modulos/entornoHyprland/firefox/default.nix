{
  usuario,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  perfiles = import ./perfiles { inherit lib inputs pkgs; };
in
{
  home-manager.users.${usuario} = {
    programs.firefox = {
      enable = true;
      package = (pkgs.wrapFirefox (pkgs.firefox-unwrapped.override { pipewireSupport = true; }) { });
      profiles = perfiles;
      languagePacks = [
        "es-MX"
        "es-ES"
      ];
    };

    xdg.desktopEntries = builtins.listToAttrs (
      map (clave: {
        name = "firefox-${clave}";
        value = {
          name = "Firefox ${clave}";
          genericName = "Navegador Web";
          exec = "firefox -p ${clave}";
          terminal = false;
          categories = [
            "Network"
            "WebBrowser"
          ];
          mimeType = [
            "text/html"
            "text/xml"
          ];
        };
      }) (builtins.attrNames perfiles)
    );
  };
}
