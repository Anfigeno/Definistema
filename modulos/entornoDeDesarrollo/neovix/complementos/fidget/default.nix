{ pkgs, ... }:
{
  programs.neovix.complementos."Fidget" = {
    paquete = pkgs.vimPlugins.fidget-nvim;
    configuracion = /* lua */ ''
      require("fidget").setup({})
    '';
    lazy.eventos = [ "VeryLazy" ];
  };
}
