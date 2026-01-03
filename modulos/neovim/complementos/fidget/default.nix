{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.fidget-nvim;
  dependencias = [ ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias string[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "Fidget",
          event = "VeryLazy",
          dependencies = dependencias,
          opts = {}
        }
      end
    '';
}
