{ pkgs, ... }:
{
  paquete = pkgs.vimPlugins.tabout-nvim;
  dependencias = with pkgs.vimPlugins; [ plenary-nvim ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias string[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "Tabout",
          event = "InsertEnter",
          dependencies = dependencias,
          config = function ()
            require("tabout").setup({
              tabkey = "<c-l>",
              backwards_tabkey = "<c-h>",
            })
          end,
        }
      end
    '';
}
