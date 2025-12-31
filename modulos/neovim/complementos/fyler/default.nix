{ pkgs, formatearDependenciasDeLazy, ... }:
let
  dependencias = with pkgs.vimPlugins; [ mini-icons ];
  # lua
in ''
  return {
    dir = "${pkgs.vimPlugins.fyler-nvim}",
    name = "Fyler",
    lazy = false,
    dependencies = { ${formatearDependenciasDeLazy dependencias} },
    opts = {},
    keys = {
      { 
        "<C-n>",
        function() require("fyler").toggle({ kind = "split_left" }) end,
        desc = "Fyler: Alternar explorador"
      }
    }
  }
''
