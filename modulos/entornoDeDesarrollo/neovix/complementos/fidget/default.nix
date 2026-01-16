{ pkgs, ... }:
{
  programs.neovix.complementos."Fidget.nvim" = {
    paquete = pkgs.vimPlugins.fidget-nvim;
    configuracion = /* lua */ ''
      require("fidget").setup({})
    '';
    lazy.eventos = [ "VeryLazy" ];
  };
}
