{
  config,
  lib,
  usuario,
  pkgs,
  ...
}:
let
  cfg = config.definistema;
  activar = cfg.entornoDeDesarrollo.delta.activar && cfg.entornoDeDesarrollo.fish.activar;
in
{
  config = lib.mkIf activar {
    home-manager.users.${usuario}.programs.fish.shellInit = # fish
      ''set -Ux fzf_diff_highlighter ${pkgs.delta}/bin/delta --paging=never'';
  };
}
