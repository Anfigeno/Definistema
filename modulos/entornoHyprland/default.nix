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
    ./hyprland
    ./kitty
    ./fuentes
    ./configuracionAdicional
  ];
in
{
  options.definistema.entornoHyprland = {
    activar = lib.mkEnableOption "Activa el módulo de entorno hyprland";
  };

  config = lib.mkIf config.definistema.entornoHyprland.activar (lib.mkMerge configuraciones);
}
