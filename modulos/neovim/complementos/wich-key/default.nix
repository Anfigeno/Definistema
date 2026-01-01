{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.which-key-nvim;
  dependencias = with pkgs.vimPlugins; [ mini-nvim ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias string[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "Wich Key",
          dependencies = dependencias,
          opts = {
            preset = "helix"
          },
        }
      end
    '';
}
