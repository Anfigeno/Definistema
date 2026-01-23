{ pkgs, lib, ... }:
{
  programs.neovix.complementos."Smooth Resize" = {
    paquete = (import ../../util/deGithub.nix { inherit lib pkgs; }) {
      rev = "5218aedc1dedb9c0c0f105b73f46e601f712a786";
      ref = "main";
      repo = "aronjohanns/smooth-resize.nvim";
    };
    configuracion = /* lua */ ''
      require("smooth-resize").setup({
        disabled_fts = { "fyler" }
      })
    '';
    lazy.eventos = [ "VeryLazy" ];
  };
}
