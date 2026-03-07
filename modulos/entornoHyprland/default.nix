{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.definistema;
in
{
  imports = [
    ./wl-clip-persist
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
      silentSDDM.activar = true;

      entornoHyprland = {
        hyprland.activar = true;
        mouse.activar = true;
        wl-clip-persist.activar = true;
      };

      paquetes = with pkgs; [
        nautilus
        amberol
        vlc
        kdePackages.gwenview
      ];
    };
  };
}
