{ lib, ... }:
let
  motoresDeBusqueda = import ./motores { inherit lib; };
in
{
  engines = motoresDeBusqueda;
  default = motoresDeBusqueda.Google.name;
  force = true;
}
