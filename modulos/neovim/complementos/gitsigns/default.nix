{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.gitsigns-nvim;
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "Gitsigns",
          event = { "BufReadPre", "BufNewFile" },
          cond = function()
            return vim.fn.isdirectory(".git") == 1
          end,
          config = function ()
            require("gitsigns").setup({
              current_line_blame = true,
            })
          end
        }
      end
    '';
}
