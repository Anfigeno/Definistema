{
  usuario,
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.definistema.entornoDeDesarrollo;
  activar = cfg.yazi.activar && cfg.fish.activar;
in
{
  config = lib.mkIf activar {
    home-manager.users.${usuario}.programs.fish.shellInit = # fish
      ''
        # ERROR: El plugin wl-clipboard.yazi no funciona con esta función
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
}
