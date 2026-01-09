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
    ./cliphist
    ./yazi
    ./bat
    ./git
    ./lsd
    ./fish
    ./delta
    ./direnv
    ./neovim
    ./zellij
    ./dircolors
  ];
in
{
  options.definistema.entornoDeDesarrollo = {
    activar = lib.mkEnableOption "Activa el módulo de entorno de desarrollo";
  };

  config = lib.mkIf config.definistema.entornoDeDesarrollo.activar (lib.mkMerge configuraciones);
}
