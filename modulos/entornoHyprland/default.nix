{
  lib,
  config,
  pkgs,
  inputs,
  usuario,
  ...
}:
let
  args = {
    inherit
      lib
      config
      pkgs
      inputs
      usuario
      ;
  };

  configuraciones = map (ruta: import ruta args) [
    ./swww
    ./pipewire
    ./hyprland
    ./firefox
    ./gtk
    ./qt
    ./kitty
    ./fuentes
    ./xdg
    ./configuracionAdicional
  ];
in
{
  options.entornoHyprland = {
    activar = lib.mkEnableOption "Activa el módulo de entornoHyprland";
  };

  config = lib.mkIf config.entornoHyprland.activar (lib.mkMerge configuraciones);
}
