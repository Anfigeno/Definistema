{
  usuario,
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.entornoDeDesarrollo;
  activar = cfg.activar || cfg.bat.activar;
in
{
  options.entornoDeDesarrollo.bat = {
    activar = lib.mkEnableOption "Activa el módulo de bat";
  };

  config = lib.mkIf activar {
    home-manager.users.${usuario} = {
      programs.bat = {
        enable = true;
        themes.mestizo = {
          src = pkgs.fetchFromGitHub {
            owner = "Anfigeno";
            repo = "MestizoBat";
            rev = "883b18567d9178cd9c88c517254fc5612d22ca67";
            sha256 = "sha256-SDec/Od+cBwvirfose7P41Br0lif9SYN8yj+1eMtReo=";
          };
          file = "mestizo.tmTheme";
        };
      };

      programs.fish.shellInit = # fish
        ''
          set -Ux BAT_THEME "mestizo"
        '';
    };
  };
}
