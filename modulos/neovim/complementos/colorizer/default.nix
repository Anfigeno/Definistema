{ pkgs, ... }:
{
  paquete = pkgs.vimPlugins.nvim-colorizer-lua;
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
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
