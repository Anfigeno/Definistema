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
  options.definistema.paquetes = lib.mkOption {
    type = lib.types.listOf lib.types.package;
    default = [ ];
    description = "Paquetes a instalar";
  };

  config = {
    home-manager.users.${usuario}.home.packages = cfg.paquetes;
  };
}
