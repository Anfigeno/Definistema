{ pkgs, ... }:
{
  paquete = pkgs.vimPlugins.nvim-ufo;
  dependencias = with pkgs.vimPlugins; [
    promise-async
    nvim-treesitter
  ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias { dir: string}[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "Ufo",
          event = { "BufReadPost", "BufNewFile" },
          dependencies = dependencias,
          config = function ()
            vim.o.foldcolumn = "1"
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            require("ufo").setup({
              provider_selector = function(_, _, _)
                return { "treesitter", "indent" }
              end,
            })
          end,
          keys = {
            {
              "zR",
              function()
                require("ufo").openAllFolds()
              end,
              desc = "Ufo: Abre todos los pliegues"
            },
            {
              "zM",
              function()
                require("ufo").closeAllFolds()
              end,
              desc = "Ufo: Cierra todos los pliegues"
            }
          }
        }
      end
    '';
}
