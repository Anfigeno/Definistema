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
    ./hyprland
    ./mouse
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
      swww.activar = true;
      fontconfig.activar = true;

      entornoHyprland = {
        hyprland.activar = true;
        mouse.activar = true;
      };
    };

    home-manager.users.${usuario} = {
      home.packages = with pkgs; [
        nautilus
        feh
        amberol
        totem
      ];
    };
  };
}
