{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.stay-centered-nvim;
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "Stay Centered",
          event = { "BufReadPost", "BufNewFile" },
          config = function()
            require("stay-centered").setup({
              skip_filetypes = { "dashboard" },
            })
          end
        }
      end
    '';
}
