{
  lib,
  config,
  usuario,
  ...
}:
let
  cfg = config.definistema;
in
{
  options.definistema.steam = {
    activar = lib.mkEnableOption "Activa el módulo de steam";
  };

  config = lib.mkIf cfg.steam.activar {
    programs.steam.enable = true;
  };
}
