{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.stay-centered-nvim;
  dependencias = [ ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias string[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "Stay Centered",
          event = { "BufReadPost", "BufNewFile" },
          dependencies = dependencias,
          config = function()
            require("stay-centered").setup({
              skip_filetypes = { "dashboard" },
            })
          end
        }
      end
    '';
}
