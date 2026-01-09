{
  usuario,
  lib,
  config,
  ...
}:
let
  cfg = config.definistema;
in
{
  options.definistema.entornoDeDesarrollo.direnv = {
    activar = lib.mkEnableOption "Activa el módulo de direnv";
  };

  config = lib.mkIf cfg.entornoDeDesarrollo.direnv.activar {
    home-manager.users.${usuario}.programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
