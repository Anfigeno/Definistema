{ pkgs, ... }:
{
  programs.neovix.complementos."Treesitter" = {
    paquete = pkgs.vimPlugins.nvim-treesitter;
    dependencias = import ./gramaticas.nix { inherit pkgs; };
    configuracion = /* lua */ ''
      require('nvim-treesitter.configs').setup({
        highlight = { enable = true },
        indent = { enable = true },
      })
    '';
    lazy.eventos = [
      "BufReadPost"
      "BufNewFile"
    ];
  };
}
