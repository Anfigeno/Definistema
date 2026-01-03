{ pkgs, deGithub, ... }: {
  paquete = deGithub {
    rev = "18fc148c83925919d94f3fc8e5c74f2d108b9b44";
    ref = "main";
    repo = "OXY2DEV/markview.nvim";
  };
  dependencias = with pkgs.vimPlugins; [ mini-icons ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias { dir: string }[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "Markview",
          lazy = false,
          dependencies = dependencias,
          config = function()
            require("markview").setup({
              preview = {
                icon_provider = "internal",
              }
            })
          end
        }
      end
    '';
}
