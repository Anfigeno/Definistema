{ lib, ... }:
let
  configuraciones = map (ruta: import ruta) [
    ./homeManagerSearch
    ./nixosSearch
    ./googleAi
    ./google
    ./youtube
  ];

  reconfiguraciones = map (
    configuracion: configuracion // { definedAliases = [ "@${configuracion.name}" ]; }
  ) configuraciones;
in
lib.listToAttrs (
  map (configuracion: {
    name = configuracion.name;
    value = configuracion;
  }) reconfiguraciones
)
