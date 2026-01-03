{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.fidget-nvim;
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "Fidget",
          event = "VeryLazy",
          opts = {}
        }
      end
    '';
}
