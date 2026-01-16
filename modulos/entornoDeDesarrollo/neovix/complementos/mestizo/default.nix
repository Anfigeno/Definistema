{ pkgs, lib, ... }:
let
  deGithub = import ../../util/deGithub.nix { inherit pkgs lib; };
in
{
  programs.neovix.complementos."Mestizo" = {
    paquete = deGithub {
      rev = "c62ea30a4cab39b8eb34973f297feb35bbac664c";
      ref = "main";
      repo = "anfigeno/mestizo.nvim";
    };
    configuracion = /* lua */ ''vim.cmd("colorscheme mestizo")'';
    lazy.activar = false;
  };
}
