{ pkgs, lib, ... }:
let
  deGithub = import ../../util/deGithub.nix { inherit pkgs lib; };
in
{
  programs.neovix.complementos."Mestizo 256" = {
    paquete = deGithub {
      rev = "6fc27f52b55503164d5e6f844bb466b99bab889d";
      ref = "main";
      repo = "TemaMestizo/Mestizo256.nvim";
    };
    configuracion = /* lua */ ''vim.cmd("colorscheme mestizo256")'';
    lazy.activar = false;
  };
}
