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
  options.definistema.openssh = {
    activar = lib.mkEnableOption "Activa el módulo de openssh";
  };

  config = lib.mkIf cfg.openssh.activar {
    services.openssh.enable = true;
  };
}
