{ pkgs, ... }:
{
  paquete = pkgs.vimPlugins.otter-nvim;
  dependencias = with pkgs.vimPlugins; [ nvim-treesitter ];
  config =
    # lua
    ''
      ---@param paquete string
      ---@param dependencias string[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "Otter",
          lazy = true,
          dependencies = dependencias,
          opts = {},
          keys = {
            {
              "<space>o",
              function()
                require("otter").activate(nil, true, true, nil)
              end,
              desc = "Otter: Activar"
            },
            {
              "<space>O",
              function()
                require("otter").deactivate()
              end,
              desc = "Otter: Desactivar"
            }
          }
        }
      end
    '';
}
