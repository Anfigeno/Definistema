{ pkgs, ... }:
{
  programs.neovix.lenguajes."JSON" = {
    gramaticas = with pkgs.vimPlugins.nvim-treesitter-parsers; [
      json
      json5
      jsonc
      jsonnet
    ];
  };
}
