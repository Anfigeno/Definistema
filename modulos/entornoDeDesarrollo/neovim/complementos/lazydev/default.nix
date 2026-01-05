{ pkgs, ... }:
{
  paquete = pkgs.vimPlugins.lazydev-nvim;
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "Lazydev",
          ft = "lua",
          opts = {}
        }
      end
    '';
}
