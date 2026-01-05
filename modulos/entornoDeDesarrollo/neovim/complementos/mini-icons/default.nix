{ pkgs, ... }:
{
  paquete = pkgs.vimPlugins.mini-icons;
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "Mini Icons",
          config = function()
            local MiniIcons = require("mini.icons")
            MiniIcons.setup()
            MiniIcons.mock_nvim_web_devicons()
          end
        }
      end
    '';
}
