{
  usuario,
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.definistema;
in
{
  options.definistema.entornoDeDesarrollo.cliphist = {
    activar = lib.mkEnableOption "Activa el módulo de cliphist";
  };

  config = lib.mkIf cfg.entornoDeDesarrollo.cliphist.activar {
    home-manager.users.${usuario} = {
      services.cliphist = {
        enable = true;
        allowImages = true;
      };

      home.packages = with pkgs; [
        wl-clipboard
      ];
    };
  };
}
