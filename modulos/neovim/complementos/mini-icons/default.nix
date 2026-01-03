{ pkgs, ... }:
{
  paquete = pkgs.vimPlugins.mini-icons;
  dependencias = [ ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias string[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "Mini Icons",
          dependencies = dependencias,
          config = function()
            local MiniIcons = require("mini.icons")
            MiniIcons.setup()
            MiniIcons.mock_nvim_web_devicons()
          end
        }
      end
    '';
}
