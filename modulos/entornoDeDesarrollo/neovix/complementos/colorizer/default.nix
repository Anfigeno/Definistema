{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Colorizer" = {
    paquete = pkgs.vimPlugins.nvim-colorizer-lua;
    opts = { };
    configuracion = /* lua */ ''require("colorizer").setup(opts)'';
    lazy.eventos = [ "BufReadPre" ];
  };
}
