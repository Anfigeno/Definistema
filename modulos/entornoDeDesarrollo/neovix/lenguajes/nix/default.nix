{ pkgs, ... }:
{
  programs.neovix.lenguajes."Nix" = {
    gramaticas = [ pkgs.vimPlugins.nvim-treesitter-parsers.nix ];
  };
}
