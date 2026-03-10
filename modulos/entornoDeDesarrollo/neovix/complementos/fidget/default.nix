{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Fidget" = {
    paquete = pkgs.vimPlugins.fidget-nvim;
    opts = { };
    configuracion = /* lua */ ''require("fidget").setup(opts)'';
    lazy.eventos = [ "VeryLazy" ];
  };
}
