{
  lib,
  config,
  usuario,
  inputs,
  ...
}:
let
  cfg = config.definistema;
in
{
  options.definistema.mestizo256nix = {
    activar = lib.mkEnableOption "Activa el módulo de mestizo256";
  };

  config = lib.mkIf cfg.mestizo256nix.activar {
    home-manager.users.${usuario}.mestizo256nix = {
      activar = true;
      paleta = inputs.mestizo256nix.paletas.mestizo;
    };
  };
}
