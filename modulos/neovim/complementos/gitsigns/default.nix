{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.gitsigns-nvim;
  dependencias = [ ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias string[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "Gitsigns",
          event = { "BufReadPre", "BufNewFile" },
          cond = function()
            return vim.fn.isdirectory(".git") == 1
          end,
          dependencies = dependencias,
          config = function ()
            require("gitsigns").setup({
              current_line_blame = true,
            })
          end
        }
      end
    '';
}
