{ pkgs, lib, ... }:
let
  deGithub = import ../../util/deGithub.nix { inherit pkgs lib; };
in
{
  programs.neovix.complementos."Mestizo 256" = {
    paquete = deGithub {
      rev = "6277a83ba27c78887484cd89abbdf98cccd371e9";
      ref = "main";
      repo = "TemaMestizo/Mestizo256.nvim";
    };
    configuracion = /* lua */ ''vim.cmd("colorscheme mestizo256")'';
    lazy.activar = false;
  };
}
