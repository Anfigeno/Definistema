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

  subModulos = map (ruta: import ruta args) [
    ./hyprland
    ./firefox
    ./gtk
    ./qt
    ./kitty
    ./fuentes
    ./xdg
  ];
in
{
  options.entornoHyprland = {
    activar = lib.mkEnableOption "Activa el módulo de entornoHyprland";
  };

  config = lib.mkIf config.entornoHyprland.activar (lib.mkMerge subModulos);
}
