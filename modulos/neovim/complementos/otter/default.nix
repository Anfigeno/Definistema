{ pkgs, formatearDependenciasDeLazy, ... }:
let
  dependencias = with pkgs.vimPlugins; [ nvim-treesitter ];
in
# lua
''
  return {
    dir = "${pkgs.vimPlugins.otter-nvim}",
    name = "Otter",
    lazy = true,
    dependencies = { ${formatearDependenciasDeLazy dependencias} },
    opts = {},
    keys = {
      {
        "<space>o",
        function()
          require("otter").activate(nil, true, true, nil)
        end,
        desc = "Otter: Activar"
      },
      {
        "<space>O",
        function()
          require("otter").deactivate()
        end,
        desc = "Otter: Desactivar"
      }
    }
  }
''
