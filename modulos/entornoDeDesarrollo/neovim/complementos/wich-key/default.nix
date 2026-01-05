{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.which-key-nvim;
  dependencias = with pkgs.vimPlugins; [ mini-icons ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias { dir: string}[]
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
