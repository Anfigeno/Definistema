{
  lib,
  config,
  ...
}:
let
  cfg = config.definistema;
in
{
  options.definistema.bluetooth = {
    activar = lib.mkEnableOption "Activa el módulo de bluetooth";
  };

  config = lib.mkIf cfg.bluetooth.activar {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
          FastConnectable = true;
        };
        Policy = {
          AutoEnable = true;
        };
      };
    };
  };
}
