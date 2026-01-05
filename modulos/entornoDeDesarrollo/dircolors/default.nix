{
  usuario,
  config,
  lib,
  ...
}:
let
  cfg = config.entornoDeDesarrollo;
  activar = cfg.activar || cfg.dircolors.activar;
in
{
  options.entornoDeDesarrollo.dircolors = {
    activar = lib.mkEnableOption "Activa el módulo de dircolors";
  };

  config = lib.mkIf activar {
    home-manager.users.${usuario}.programs.dircolors = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
      settings = {
        COLOR = "tty";

        NORMAL = "00";
        RESET = "0";

        FILE = "00";
        DIR = "01;31";
        LINK = "36";

        STICKY_OTHER_WRITABLE = "01;04;30;41";
        OTHER_WRITABLE = "04;31";
        STICKY = "01;30;41";
      };
    };
  };
}
