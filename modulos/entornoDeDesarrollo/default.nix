{
  lib,
  config,
  ...
}:
let
  cfg = config.definistema;
in
{
  imports = [
    ./neovix
    ./bat
    ./cliphist
    ./delta
    ./dircolors
    ./direnv
    ./fish
    ./gh
    ./git
    ./lsd
    ./neovim
    ./yazi
    ./zellij
    ./ssh
  ];

  options.definistema.entornoDeDesarrollo = {
    activar = lib.mkEnableOption "Activa el módulo de entorno de desarrollo";
  };

  config = lib.mkIf cfg.entornoDeDesarrollo.activar {
    definistema.entornoDeDesarrollo = {
      bat.activar = true;
      cliphist.activar = true;
      delta.activar = true;
      dircolors.activar = true;
      direnv.activar = true;
      fish.activar = true;
      gh.activar = true;
      git.activar = true;
      lsd.activar = true;
      neovim.activar = true;
      yazi.activar = true;
      zellij.activar = true;
      ssh.activar = true;
    };
  };
}
