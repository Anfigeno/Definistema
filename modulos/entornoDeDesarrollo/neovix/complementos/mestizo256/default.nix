{ pkgs, lib, ... }:
let
  deGithub = import ../../util/deGithub.nix { inherit pkgs lib; };
in
{
  programs.neovix.complementos."Mestizo 256" = {
    paquete = deGithub {
      rev = "332ad7be30dfbb50c783ce665aeb87819bca61f4";
      ref = "main";
      repo = "TemaMestizo/Mestizo256.nvim";
    };
    configuracion = /* lua */ ''vim.cmd("colorscheme mestizo256")'';
    lazy.activar = false;
  };
}
