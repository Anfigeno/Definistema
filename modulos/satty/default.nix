{
  pkgs,
  lib,
  config,
  usuario,
  ...
}:
let
  cfg = config.definistema;
in
{
  options.definistema.satty = {
    activar = lib.mkEnableOption "Activa el módulo de satty";
  };

  config = lib.mkIf cfg.satty.activar {
    home-manager.users.${usuario} =
      let
        rutaDeCarpetaDeCapturas = "${config.home-manager.users.${usuario}.xdg.userDirs.pictures}/Capturas";
      in
      {
        home.file."${rutaDeCarpetaDeCapturas}/.keep".text = "";
        programs.satty = {
          enable = true;
          settings = {
            general = {
              fullscreen = true;
              corner-roundness = 12;
              initial-tool = "crop";
              early-exit = true;
              copy-command = "${pkgs.wl-clipboard}/bin/wl-copy";
              output-filename = "~/${rutaDeCarpetaDeCapturas}/%d-%m-%Y_%H:%M:%S.png";
              save-after-copy = true;
              actions-on-escape = [ "exit" ];
              actions-on-enter = [
                "save-to-clipboard"
                "save-to-file"
                "exit"
              ];
            };
            font = {
              family = "Iosevka";
              style = "Regular";
            };
          };
        };
      };
  };
}
