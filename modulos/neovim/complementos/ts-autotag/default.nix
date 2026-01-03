{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.ts-autotag-nvim;
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "TS Autotag",
          config = function ()
            require("ts-autotag").setup({
              auto_rename = { enable = true }
            })
          end
        }
      end
    '';
}
