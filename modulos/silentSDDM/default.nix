{
  lib,
  config,
  inputs,
  ...
}:
let
  cfg = config.definistema;
in
{
  options.definistema.silentSDDM = {
    activar = lib.mkEnableOption "Activa el módulo de silentSDDM";
  };

  config = lib.mkIf cfg.silentSDDM.activar {
    programs.silentSDDM = {
      enable = true;
      theme = "default";
    };
  };
}
