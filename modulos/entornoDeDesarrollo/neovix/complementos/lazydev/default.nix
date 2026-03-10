{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Lazydev" = {
    paquete = pkgs.vimPlugins.lazydev-nvim;
    opts = { };
    configuracion = /* lua */ ''require("lazydev").setup(opts)'';
    lazy.tiposDeArchivo = [ "lua" ];
  };
}
