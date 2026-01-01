{ pkgs, ... }:
{
  paquete = pkgs.vimPlugins.no-neck-pain-nvim;
  dependencias = [ ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias string[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "No Neck Pain",
          dependencies = dependencias,
          keys = {
            {
              "<leader>nn",
              function ()
                require("no-neck-pain").toggle()
              end,
              desc = "No Neck Pain: Alternar centrar ventana"
            }
          }
        }
      end
    '';
}
