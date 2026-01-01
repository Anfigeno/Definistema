{ pkgs, ... }:
{
  paquete = pkgs.vimPlugins.nvim-colorizer-lua;
  dependencias = [ ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias string[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "Colorizer",
          event = "BufReadPre",
          dependencies = dependencias,
          opts = {}
        }
      end
    '';
}
