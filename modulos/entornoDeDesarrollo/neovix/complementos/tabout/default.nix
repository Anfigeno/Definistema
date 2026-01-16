{ pkgs, ... }:
{
  programs.neovix.complementos."Tabout" = {
    paquete = pkgs.vimPlugins.tabout-nvim;
    configuracion = /* lua */ ''
      require("tabout").setup({
        tabkey = "<c-l>",
        backwards_tabkey = "<c-h>",
      })
    '';
    lazy.eventos = [ "InsertEnter" ];
  };
}
