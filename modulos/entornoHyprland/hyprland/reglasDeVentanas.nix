{ config }:
let
  cfg = config.definistema;
in
[
  (if cfg.kitty.activar then "float, class:kitty" else null)
  (if cfg.entornoDeDesarrollo.neovim.activar then "float, class:Neovim" else null)
]
