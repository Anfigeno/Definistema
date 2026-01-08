{
  usuario,
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
let
  cfg = config.entornoDeDesarrollo;
  activar = cfg.activar || cfg.yazi.activar;
in
{
  options.entornoDeDesarrollo.yazi = {
    activar = lib.mkEnableOption "Activa el módulo de yazi";
  };

  config = lib.mkIf activar {
    home-manager.users.${usuario} = {
      programs.yazi = {
        enable = true;
        theme = inputs.mestizo-nix.integraciones.yazi;
        settings = {
          mgr = {
            show_hidden = true;
            sort_dir_first = true;
          };
        };
      };

      programs.fish.shellInit = # fish
        ''
          function y
          	set tmp (mktemp -t "yazi-cwd.XXXXXX")
          	${pkgs.yazi}/bin/yazi $argv --cwd-file="$tmp"
          	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
          		builtin cd -- "$cwd"
          	end
          	rm -f -- "$tmp"
          end
        '';
    };
  };
}
