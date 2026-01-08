{ lib, ... }:
{
  options.entornoDeDesarrollo = {
    activar = lib.mkEnableOption "Activa el módulo de entorno de desarrollo";
  };

  imports = [
    ./cliphist
    ./yazi
    ./bat
    ./dircolors
    ./delta
    ./fish
    ./git
    ./lsd
    ./neovim
    ./zellij
    ./direnv
  ];
}
