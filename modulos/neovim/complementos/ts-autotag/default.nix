{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.ts-autotag-nvim;
  dependencias = [ ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias string[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "TS Autotag",
          dependencies = dependencias,
          config = function ()
            require("ts-autotag").setup({
              auto_rename = { enable = true }
            })
          end
        }
      end
    '';
}
