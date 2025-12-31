{ pkgs, lib }:
let
  nombresDeComplementos = [
    "otter"
    "bufferline"
    "neoformat"
    "rainbow-delimiters"
    "autopairs"
    "telescope"
    "modes"
    "lualine"
    "navic"
    "hover"
    "fidget"
    "treesitter"
    "mestizo"
    "cmp"
    "lspconfig"
    "fyler"
    "mini"
    "noice"
    "dashboard"
    "stay-centered"
  ];

  deGithub = import ./util/deGithub.nix { inherit pkgs lib; };
  formatearDependenciasDeLazy = import ./util/formatearDependenciasDeLazy.nix;
in map (nombreDeComplemento:
  #lua
  ''
    (function()
      ${
        import ./complementos/${nombreDeComplemento} {
          inherit pkgs deGithub formatearDependenciasDeLazy lib;
        }
      }
    end)()
  '') nombresDeComplementos
