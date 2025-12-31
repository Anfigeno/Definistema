{ pkgs, formatearDependenciasDeLazy, ... }:
let
  dependencias = [ ];
  # lua
in ''
  return {
    dir = "${pkgs.vimPlugins.fidget-nvim}",
    name = "Fidget",
    dependencies = { ${formatearDependenciasDeLazy dependencias} },
    opts = {}
  }
''
