{
  pkgs,
  usuario,
  config,
  lib,
  ...
}:
let
  cfg = config.definistema;
  activar = cfg.entornoHyprland.hyprland.activar && cfg.entornoDeDesarrollo.neovim.activar;
in
{
  config = lib.mkIf activar {
    home-manager.users.${usuario}.wayland.windowManager.hyprland.settings =
      let
        editarConNeovim =
          pkgs.writeShellScriptBin "editar-con-neovim" # fish
            ''
              RUTA_DE_ARCHIVO="/tmp/Editar_con_Neovim.md"
              ${pkgs.wl-clipboard}/bin/wl-paste -n >> $RUTA_DE_ARCHIVO
              ${pkgs.kitty}/bin/kitty --class "Neovim" nvim $RUTA_DE_ARCHIVO
              cat $RUTA_DE_ARCHIVO | ${pkgs.wl-clipboard}/bin/wl-copy -n
              rm $RUTA_DE_ARCHIVO
              exit
            '';
      in
      {
        windowrule = [
          "float, class:Neovim"
          "size 600 400, class:Neovim"
        ];
        bind = [
          "SUPER+SHIFT, e, exec, ${editarConNeovim}/bin/editar-con-neovim"
        ];
      };
  };
}
