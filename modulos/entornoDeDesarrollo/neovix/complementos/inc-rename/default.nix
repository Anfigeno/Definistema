{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."IncRename" = {
    paquete = pkgs.vimPlugins.inc-rename-nvim;
    opts = { };
    configuracion = /* lua */ ''require("inc_rename").setup(opts)'';
    lazy = {
      comandos = [ "IncRename" ];
      teclas."grn" = {
        comando = ":IncRename ";
        descripcion = "LSP: Renombrar";
      };
    };
  };
}
