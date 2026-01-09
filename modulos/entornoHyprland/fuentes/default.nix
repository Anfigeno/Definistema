{
  pkgs,
  usuario,
  lib,
  config,
  ...
}:
let
  cfg = config.definistema;
in
{
  options.definistema.entornoHyprland.fuentes = {
    activar = lib.mkEnableOption "Activa el módulo de fuentes";
  };

  config = lib.mkIf cfg.entornoHyprland.fuentes.activar {
    home-manager.users.${usuario}.home.packages = with pkgs; [
      nerd-fonts.iosevka
      iosevka
      monaspace
      ubuntu-classic
      noto-fonts-color-emoji
      noto-fonts
      google-fonts
      dejavu_fonts
      liberation_ttf
    ];
  };
}
