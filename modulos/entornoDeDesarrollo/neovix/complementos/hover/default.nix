{ pkgs, ... }:
{
  programs.neovix.complementos."Hover" = {
    paquete = pkgs.vimPlugins.hover-nvim;
    configuracion = /* lua */ ''
      require("hover").config({
        init = function()
          require("hover.providers.lsp")
          require("hover.providers.gh")
          require("hover.providers.gh_user")
          require("hover.providers.fold_preview")
          require("hover.providers.diagnostic")
          require("hover.providers.dictionary")
        end,
        preview_opts = {
          border = "single",
        },
        preview_window = false,
        title = true,
      })
    '';
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
