{ pkgs, formatearDependenciasDeLazy, ... }:
let
  dependencias = import ./gramaticas.nix { inherit pkgs; };
  #lua
in ''
  return {
    dir = "${pkgs.vimPlugins.nvim-treesitter}",
    name = "Treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    dependencies = { ${formatearDependenciasDeLazy dependencias} },
    config = function()
      require('nvim-treesitter.configs').setup({
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  }
''
