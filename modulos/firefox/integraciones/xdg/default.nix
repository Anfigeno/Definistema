{
  usuario,
  lib,
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
      { config, ... }:
      {
        xdg.desktopEntries =
          config.programs.firefox.profiles
          |> lib.mapAttrsToList (
            clave: _: {
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
            }
          )
          |> builtins.listToAttrs;
      };
  };
}
