{
  config,
  lib,
  usuario,
  pkgs,
  ...
}:
let
  cfg = config.definistema;
  activar = cfg.entornoDeDesarrollo.lsd.activar && cfg.entornoDeDesarrollo.fish.activar;
in
{
  config = lib.mkIf activar {
    home-manager.users.${usuario}.programs.fish.shellInit = # fish
      ''
        set -Ux fzf_preview_dir_cmd '${pkgs.lsd}/bin/lsd --color always --icon always -1 --group-directories-first'
      '';

  };
}
