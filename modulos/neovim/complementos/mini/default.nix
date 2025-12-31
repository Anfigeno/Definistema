{ pkgs, formatearDependenciasDeLazy, ... }:
let
  dependencias = with pkgs.vimPlugins; [ nvim-web-devicons ];
  # lua
in ''
  return {
    dir = "${pkgs.vimPlugins.mini-nvim}",
    name = "Mini",
    event = "VeryLazy",
    dependencies = { ${formatearDependenciasDeLazy dependencias} },
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
''
