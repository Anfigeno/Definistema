{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.inc-rename-nvim;
  dependencias = [ ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias string[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "IncRename",
          cmd = "IncRename",
          dependencies = dependencias,
          opts = {},
          keys = {
            {
              "<s-r>",
              ":IncRename ",
              desc = "IncRename"
            }
          }
        }
      end
    '';
}
