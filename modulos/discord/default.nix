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
  options.definistema.discord = {
    activar = lib.mkEnableOption "Activa el módulo de discord";
  };

  config = lib.mkIf cfg.discord.activar {
    home-manager.users.${usuario}.programs.discord.enable = true;
  };
}
