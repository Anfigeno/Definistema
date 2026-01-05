{
  usuario,
  pkgs,
  lib,
  config,
  ...
}:
let

  cfg = config.entornoDeDesarrollo;
  activar = cfg.activar || cfg.zellij.activar;
in
{
  options.entornoDeDesarrollo.zellij = {
    activar = lib.mkEnableOption "Activa el módulo de zellij";
  };

  config = lib.mkIf activar {
    home-manager.users.${usuario}.programs.zellij = {
      enable = true;
      settings = {
        show_startup_tips = false;
        theme = "mestizo";
        default_shell = "${pkgs.fish}/bin/fish";
        default_layout = "compact";
        pane_frames = false;
        copy_on_select = true;
        session_name = "Zel";
        attach_to_session = true;
        support_kitty_keyboard_protocol = false;
        themes.mestizo = import ./temaMestizo.nix;
      };
      extraConfig = import ./atajosDeTeclado.nix;
    };
  };
}
