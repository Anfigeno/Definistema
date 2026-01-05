{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.rainbow-delimiters-nvim;
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "Rainbow Delimiters",
          event = { "BufReadPost", "BufNewFile" },
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
      end
    '';
}
