{
  pkgs,
  usuario,
  config,
  lib,
  ...
}:
let
  cfg = config.definistema;
  activar = cfg.entornoHyprland.hyprland.activar && cfg.entornoDeDesarrollo.neovix.activar;
in
{
  config = lib.mkIf activar {
    home-manager.users.${usuario}.wayland.windowManager.hyprland.settings = {
      windowrule = [
        "float, class:Neovim"
        "size 600 700, class:Neovim"
      ];
      bind =
        let
          editarConNeovim = import ./scripts/editarConNeovim.nix { inherit pkgs; };
        in
        [
          "SUPER+SHIFT, e, exec, ${editarConNeovim}/bin/editar-con-neovim"
        ];
    };
  };
}
