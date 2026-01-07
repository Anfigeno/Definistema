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
  options.entornoHyprland = lib.listToAttrs (
    map (subModulo: {
      name = subModulo.nombre;
      value = {
        activar = lib.mkOption {
          type = lib.types.bool;
          description = "Activa el módulo de ${subModulo.nombre}";
          default = false;
        };
      };
    }) subModulos
  );

  config = lib.mkMerge (
    map (
      subModulo: lib.mkIf config.entornoHyprland.${subModulo.nombre}.activar subModulo.configuracion
    ) subModulos
  );
}
