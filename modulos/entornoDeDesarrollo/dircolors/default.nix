{
  usuario,
  config,
  lib,
  ...
}:
let
  cfg = config.definistema;
in
{
  options.definistema.entornoDeDesarrollo.dircolors = {
    activar = lib.mkEnableOption "Activa el módulo de dircolors";
  };

  config = lib.mkIf cfg.entornoDeDesarrollo.dircolors.activar {
    home-manager.users.${usuario}.programs.dircolors = {
      enable = true;
      enableFishIntegration = lib.mkIf cfg.entornoDeDesarrollo.fish.activar true;
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
