{ pkgs, ... }:
{
  programs.neovix.lenguajes."Git" = {
    gramaticas = with pkgs.vimPlugins.nvim-treesitter-parsers; [
      gitcommit
      gitignore
      git_config
      git_rebase
      gitattributes
    ];
  };
}
