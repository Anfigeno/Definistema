{ pkgs, ... }:
{
  programs.neovix.complementos."Lazydev" = {
    paquete = pkgs.vimPlugins.lazydev-nvim;
    configuracion = /* lua */ ''
      require("lazydev").setup({})
    '';
    lazy.tiposDeArchivo = [ "lua" ];
  };
}
