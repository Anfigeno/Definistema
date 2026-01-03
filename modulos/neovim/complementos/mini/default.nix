{ pkgs, ... }:
{
  paquete = pkgs.vimPlugins.mini-nvim;
  dependencias = [ ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias string[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "Mini",
          event = "VeryLazy",
          dependencies = dependencias,
          config = function()
            require("mini.surround").setup()

            require("mini.move").setup({
              mappings = {
                left = "<M-h>",
                down = "<M-j>",
                up = "<M-k>",
                right = "<M-l>",
                line_left = "<M-h>",
                line_down = "<M-j>",
                line_up = "<M-k>",
                line_right = "<M-l>",
              },
              options = {
                reindent_linewise = true,
              },
            })

            local MiniIcons = require("mini.icons")
            MiniIcons.setup()
            MiniIcons.mock_nvim_web_devicons()
          end
        }
      end
    '';
}
