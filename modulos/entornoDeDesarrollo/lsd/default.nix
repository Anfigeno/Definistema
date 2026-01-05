{
  usuario,
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.entornoDeDesarrollo;
  activar = cfg.activar || cfg.lsd.activar;
in
{
  options.entornoDeDesarrollo.lsd = {
    activar = lib.mkEnableOption "Activa el módulo de lsd";
  };

  config = lib.mkIf activar {
    home-manager.users.${usuario} = {
      programs.lsd = {
        enable = true;
        enableFishIntegration = true;
        colors = inputs.mestizo-nix.integraciones.lsd;
      };

      programs.fish.shellInit = # fish
        ''
          set -Ux fzf_preview_dir_cmd '${pkgs.lsd}/bin/lsd --color always --icon always -1 --group-directories-first'
        '';
    };
  };
}
