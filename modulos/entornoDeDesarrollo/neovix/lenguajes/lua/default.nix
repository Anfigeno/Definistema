{ pkgs, ... }:
{
  programs.neovix.lenguajes."Lua" = {
    gramaticas = with pkgs.vimPlugins.nvim-treesitter-parsers; [
      lua
      luap
      luau
      luadoc
    ];
  };
}
