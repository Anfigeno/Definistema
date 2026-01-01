{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.smear-cursor-nvim;
  dependencias = [ ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias string[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "Smear Cursor",
          dependencies = dependencias,
          opts = {}
        }
      end
    '';
}
