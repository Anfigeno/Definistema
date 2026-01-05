{ pkgs, ... }:
{
  paquete = pkgs.vimPlugins.no-neck-pain-nvim;
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "No Neck Pain",
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
