{ lib, pkgs, ... }:
let
  extensiones = import ./extensiones.nix { inherit pkgs; };
  perfilBase = {
    extensions = extensiones;
    settings = import ./configuracion.nix;
    search = import ./busqueda;
  };

  perfilBaseAnonimo = {
    extensions = extensiones;
    settings = import ./configuracionAnonima.nix;
  };
in
lib.listToAttrs (
  map
    (
      perfil:
      let
        perfilAAplicar = if perfil ? anonima then perfilBaseAnonimo else perfilBase;
      in
      {
        name = perfil.configuracion.name;
        value = perfil.configuracion;
      }
      // perfilAAplicar
    )
    [
      {
        configuracion = {
          name = "Productividad";
          id = 0;
          isDefault = true;
        };
      }
      {
        configuracion = {
          name = "Defecto";
          id = 1;
        };
      }
      {
        anonima = true;
        configuracion = {
          name = "Procrastinación";
          id = 2;
        };
      }
      {
        anonima = true;
        configuracion = {
          name = "Investigación";
          id = 3;
        };
      }
    ]
)
