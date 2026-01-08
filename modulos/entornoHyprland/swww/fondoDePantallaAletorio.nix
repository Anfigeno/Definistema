{ pkgs, inputs, ... }:
let
  rutasDeImagenes = builtins.concatStringsSep "\n" (
    map (ruta: "${ruta}") (import inputs.fondos-de-pantalla.imagenes)
  );
in
pkgs.writeShellScriptBin "fondo-de-pantalla-aleatorio" # fish
  ''
    IMAGENES=(
      ${rutasDeImagenes}
    )

    IMAGEN_ALEATORIA="''${IMAGENES[$RANDOM % ''${#IMAGENES[@]}]}"

    ${pkgs.swww}/bin/swww img $IMAGEN_ALEATORIA --transition-type grow
  ''
