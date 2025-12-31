{ pkgs, formatearDependenciasDeLazy, ... }:
let
  dependencias = [ ];
  # lua
in ''
  return {
    dir = "${pkgs.vimPlugins.stay-centered-nvim}",
    name = "Stay Centered",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { ${formatearDependenciasDeLazy dependencias} },
    config = function()
      require("stay-centered").setup({
        skip_filetypes = { "dashboard" },
      })
    end
  }
''
