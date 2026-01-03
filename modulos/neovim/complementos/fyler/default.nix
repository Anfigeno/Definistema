{ pkgs, ... }:
{
  paquete = pkgs.vimPlugins.fyler-nvim;
  dependencias = with pkgs.vimPlugins; [ mini-icons ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias { dir: string }[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "Fyler",
          dependencies = dependencias,
          opts = {},
          keys = {
            {
              "<C-n>",
              function()
                require("fyler").toggle({ kind = "split_left" })
              end,
              desc = "Fyler: Alternar explorador"
            }
          }
        }
      end
    '';
}
