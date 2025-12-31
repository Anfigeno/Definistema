{ pkgs, formatearDependenciasDeLazy, ... }:
let
  dependencias = [ ];
  # lua
in ''
  return {
    dir = "${pkgs.vimPlugins.hover-nvim}",
    name = "Hover",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { ${formatearDependenciasDeLazy dependencias} },
    config = function()
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
    end,
    keys = {
      {
        "K",
        function()
          require("hover").open()
        end,
        desc = "Hover: Mostrar información sobre el elemento",
      },
      {
        "gK",
        function()
          require("hover").select()
        end,
        desc = "Hover: Mostrar información sobre el elemento seleccionado",
      },
    },
  }
''
