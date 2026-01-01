{ pkgs, ... }:
{
  paquete = pkgs.vimPlugins.lazydev-nvim;
  dependencias = [ ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias string[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "Lazydev",
          ft = "lua",
          dependencies = dependencias,
          opts = {}
        }
      end
    '';
}
