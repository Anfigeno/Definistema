{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.neovix.complementos."Modes" = {
    activar = false;
    paquete = (import ../../util/deGithub.nix { inherit pkgs lib; }) {
      rev = "0932ba4e0bdc3457ac89a8aeed4d56ca0b36977a";
      ref = "main";
      repo = "mvllow/modes.nvim";
    };
    dependencias = [ config.programs.neovix.complementos."Mestizo".paquete ];
    configuracion = /* lua */ ''
      require("modes").setup({
        colors = require("mestizo.claves.integraciones.especial.modes"),
      })
    '';
    lazy.eventos = [
      "BufReadPost"
      "BufNewFile"
    ];
  };
}
