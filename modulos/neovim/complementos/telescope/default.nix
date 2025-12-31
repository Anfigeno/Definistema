{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.telescope-nvim;
  dependencias = with pkgs.vimPlugins; [ plenary-nvim ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias string[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "Telescope",
          dependencies = dependencias,
          config = function()
            require("telescope").setup({
              defaults = {
                prompt_prefix = " ",
                selection_caret = " ",

                sorting_strategy = "ascending",
                layout_config = {
                  horizontal = {
                    prompt_position = "top",
                  },
                  height = 0.80,
                },
              },
            })
          end,
          keys = {
            {
              "<space>ff",
              function()
                require("telescope.builtin").find_files()
              end,
              desc = "Telescope: Encontrar archivos",
            },
            {
              "<space>fg",
              function()
                require("telescope.builtin").live_grep()
              end,
              desc = "Telescope: Grep",
            },
            {
              "<space>fs",
              function()
                require("telescope.builtin").lsp_document_symbols()
              end,
              desc = "Telescope: Simbolos",
            },
            {
              "<space>fr",
              function()
                require("telescope.builtin").lsp_references()
              end,
              desc = "Telescope: Encontrar referencias",
            },
          },
        }
      end
    '';
}
