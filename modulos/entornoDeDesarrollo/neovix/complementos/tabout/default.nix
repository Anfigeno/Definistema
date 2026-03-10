{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Tabout" = {
    paquete = pkgs.vimPlugins.tabout-nvim;
    opts = {
      tabkey = "<Tab>";
      backwards_tabkey = "<s-Tab>";
    };
    configuracion = /* lua */ ''require("tabout").setup(opts)'';
    lazy.eventos = [ "InsertEnter" ];
  };
}
