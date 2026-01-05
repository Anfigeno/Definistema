{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.nvim-treesitter;
  dependencias = import ./gramaticas.nix { inherit pkgs; };
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias { dir: string}[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "Treesitter",
          event = { "BufReadPost", "BufNewFile" },
          cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
          dependencies = dependencias,
          config = function()
            require('nvim-treesitter.configs').setup({
              highlight = { enable = true },
              indent = { enable = true },
            })
          end,
        }
      end
    '';
}
