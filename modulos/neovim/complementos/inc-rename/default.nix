{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.inc-rename-nvim;
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "IncRename",
          cmd = "IncRename",
          opts = {},
          keys = {
            {
              "grn",
              ":IncRename ",
              desc = "LSP: Renombrar"
            }
          }
        }
      end
    '';
}
