{ pkgs, inputs, ... }:
map (ruta: import ruta { inherit pkgs inputs; }) [
  ./fzf
  ./done
  ./tide
]
