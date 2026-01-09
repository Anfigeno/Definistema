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
  options.definistema.virtualbox = {
    activar = lib.mkEnableOption "Activa el módulo de virtualbox";
  };

  config = lib.mkIf cfg.virtualbox.activar {
    virtualisation.virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = [ usuario ];
  };
}
