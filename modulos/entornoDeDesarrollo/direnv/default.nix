{
  usuario,
  config,
  lib,
  ...
}:
let
  cfg = config.entornoDeDesarrollo;
  activar = cfg.activar || cfg.direnv.activar;
in
{
  options.entornoDeDesarrollo.direnv = {
    activar = lib.mkEnableOption "Activa el módulo de direnv";
  };

  config = lib.mkIf activar {
    home-manager.users.${usuario}.programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
