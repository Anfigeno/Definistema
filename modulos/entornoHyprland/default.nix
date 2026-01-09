{
  lib,
  config,
  pkgs,
  usuario,
  ...
}:
let
  cfg = config.definistema;
in
{
  imports = [
    ./integraciones
  ];

  options.definistema.entornoHyprland = {
    activar = lib.mkEnableOption "Activa el módulo de entorno hyprland";
  };

  config = lib.mkIf cfg.entornoHyprland.activar {
    definistema = {
      xdg.activar = true;
      gtk.activar = true;
      qt.activar = true;
      pipewire.activar = true;
      kitty.activar = true;
    };

    home-manager.users.${usuario} = {
      home.packages = with pkgs; [
        nautilus
        feh
        mpv
        amberol
      ];
    };
  };
}
