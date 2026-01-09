{
  config,
  lib,
  usuario,
  ...
}:
let
  cfg = config.definistema;
  activar = cfg.entornoDeDesarrollo.bat.activar && cfg.entornoDeDesarrollo.fish.activar;
in
{
  config = lib.mkIf activar {
    home-manager.users.${usuario}.programs.fish.shellInit = # fish
      ''
        set -Ux BAT_THEME "mestizo"
      '';
  };
}
