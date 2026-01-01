{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.satellite-nvim;
  dependencias = [ ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias string[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "Satellite",
          event = { "BufReadPost", "BufNewFile" },
          dependencies = dependencias,
          config = function ()
            require("satellite").setup({
              excluded_filetypes = {
                "Telescope",
                "Outline",
                "neo-tree",
                "toggleterm",
                "dashboard",
              },
            })
          end
        }
      end
    '';
}
