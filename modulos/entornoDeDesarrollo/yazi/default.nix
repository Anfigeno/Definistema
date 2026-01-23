{
  usuario,
  pkgs,
  inputs,
  lib,
  config,
  ...
}:
let
  cfg = config.definistema;
in
{
  imports = [
    ./integraciones
  ];

  options.definistema.entornoDeDesarrollo.yazi = {
    activar = lib.mkEnableOption "Activa el módulo de yazi";
  };

  config = lib.mkIf cfg.entornoDeDesarrollo.yazi.activar {
    home-manager.users.${usuario}.programs.yazi = {
      enable = true;
      theme = inputs.mestizo-nix.integraciones.yazi;
      settings = {
        mgr = {
          show_hidden = true;
          sort_dir_first = true;
          ratio = [
            2
            3
            4
          ];
        };
        opener = {
          play = [
            {
              run = ''${pkgs.vlc}/bin/vlc "$@"'';
              orphan = true;
            }
          ];
          image = [
            {
              run = ''${pkgs.kdePackages.gwenview}/bin/gwenview "$@"'';
              orphan = true;
            }
          ];
        };
        open.rules = [
          {
            mime = "image/*";
            use = "image";
          }
        ];
      };
      extraPackages = with pkgs; [
        wl-clipboard
      ];
      plugins = with pkgs.yaziPlugins; {
        wl-clipboard = wl-clipboard;
      };
      keymap = {
        mgr.prepend_keymap = [
          {
            on = "y";
            run = [
              "plugin wl-clipboard"
              "yank"
            ];
          }
        ];
      };
    };
  };
}
