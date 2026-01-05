{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.satellite-nvim;
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "Satellite",
          event = { "BufReadPost", "BufNewFile" },
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
