{ pkgs, lib }:
let
  atajos = map (ruta: import ruta { inherit pkgs; }) [
    ./escencial.nix
    ./lanzadores.nix
  ];
in
lib.lists.flatten atajos
