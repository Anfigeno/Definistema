{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.smear-cursor-nvim;
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "Smear Cursor",
          opts = {}
        }
      end
    '';
}
