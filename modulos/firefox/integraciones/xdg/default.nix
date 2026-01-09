{
  usuario,
  lib,
  inputs,
  pkgs,
  config,
  ...
}:
let
  cfg = config.definistema;
  activar = cfg.firefox.activar && cfg.xdg.activar;
in
{
  config = lib.mkIf activar {
    home-manager.users.${usuario} =
      let
        perfiles = import ../../perfiles { inherit lib inputs pkgs; };
      in
      {
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
  };
}
