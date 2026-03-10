{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Hover" = {
    # activar = false;
    paquete = pkgs.vimPlugins.hover-nvim;
    opts = {
      providers = [
        "hover.providers.diagnostic"
        "hover.providers.lsp"
        "hover.providers.gh"
        "hover.providers.fold_preview"
        "hover.providers.highlight"
      ];
      preview_opts = {
        border = "rounded";
      };
      preview_window = false;
      title = true;
    };
    configuracion = /* lua */ ''require("hover").config(opts)'';
    lazy = {
      eventos = [
        "BufReadPost"
        "BufNewFile"
      ];
      teclas."K" = {
        accion = /* lua */ ''require("hover").open()'';
        descripcion = "Hover: Mostrar información sobre el elemento";
      };
    };
  };
}
