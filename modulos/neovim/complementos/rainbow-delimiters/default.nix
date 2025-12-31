{ pkgs, formatearDependenciasDeLazy, ... }:
let
  dependencias = [ ];
  # lua
in ''
  return {
    dir = "${pkgs.vimPlugins.rainbow-delimiters-nvim}",
    name = "Rainbow Delimiters",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { ${formatearDependenciasDeLazy dependencias} },
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = { [""] = "rainbow-delimiters", lua = "rainbow-blocks" },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end
  }
''
