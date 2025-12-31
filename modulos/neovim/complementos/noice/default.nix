{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.noice-nvim;
  dependencias = with pkgs.vimPlugins; [ nui-nvim ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias string[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "Noice",
          dependencies = dependencias,
          config = function()
            require("noice").setup({
              lsp = {
                override = {
                  ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                  ["vim.lsp.util.stylize_markdown"] = true,
                  ["cmp.entry.get_documentation"] = true,
                },
              },
              presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = true,
                lsp_doc_border = false,
              },
            })
          end
        }
      end
    '';
}
