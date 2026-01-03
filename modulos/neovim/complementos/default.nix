{ pkgs, lib }:
let
  rutasDeComplementos = [
    ./markview
    ./direnv
    ./wich-key
    ./lazydev
    ./keep-split-ratio
    ./ts-autotag
    ./smear-cursor
    ./tabout
    ./todo-comments
    ./inc-rename
    ./colorizer
    ./statuscol
    ./satellite
    ./gitsigns
    ./ufo
    ./otter
    ./bufferline
    ./neoformat
    ./rainbow-delimiters
    ./autopairs
    ./telescope
    ./modes
    ./lualine
    ./navic
    ./hover
    ./fidget
    ./treesitter
    ./mestizo
    ./cmp
    ./lspconfig
    ./fyler
    ./mini-move
    ./mini-icons
    ./mini-surround
    ./noice
    ./dashboard
    ./stay-centered
  ];

  deGithub = import ../util/deGithub.nix { inherit pkgs lib; };
  formatearDependenciasDeLazy = import ../util/formatearDependenciasDeLazy.nix;
in
map (
  rutaDeComplemento:
  #lua
  let
    complemento = import rutaDeComplemento { inherit pkgs deGithub; };
    #lua
  in
  ''
    (${complemento.config})("${complemento.paquete}", { ${formatearDependenciasDeLazy complemento.dependencias} })
  ''
) rutasDeComplementos
