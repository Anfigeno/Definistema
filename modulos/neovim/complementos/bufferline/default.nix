{ pkgs, formatearDependenciasDeLazy, ... }:
let
  dependencias = with pkgs.vimPlugins; [ nvim-web-devicons scope-nvim ];
  # lua
in ''
  return {
    dir = "${pkgs.vimPlugins.bufferline-nvim}",
    name = "Bufferline",
    event = "BufEnter",
    dependencies = { ${formatearDependenciasDeLazy dependencias} },
    config = function()
      require("scope").setup({})

      require("bufferline").setup({
        highlights = require("mestizo.claves.integraciones.especial.bufferline"),
        options = {
          offsets = {
            {
              filetype = "fyler",
              text = "Archivos",
              highlight = "Normal",
              text_align = "center",
              separator = true,
            },
          },
        },
      })
    end,
    keys = {
      {
        "<tab>",
        function()
          require("bufferline").cycle(1)
        end,
        desc = "Bufferline: Siguiente buffer",
      },
      {
        "<s-tab>",
        function()
          require("bufferline").cycle(-1)
        end,
        desc = "Bufferline: Anterior buffer",
      },
      {
        "<space>x",
        "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>",
        desc = "Bufferline: Cerrar buffer",
      },
      {
        "<c-t>",
        "<cmd>tabnew<cr>",
        desc = "Nueva pestaña",
      },
      {
        "<m-tab>",
        "<cmd>tabnext<cr>",
        desc = "Siguiente pestaña",
      },
    },
  }
''
