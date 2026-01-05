{
  pkgs,
  complementos,
}:
let
  formatearComplementosDeLazy = import ./util/formatearComplementosDeLazy.nix;
in
{
  plugin = pkgs.vimPlugins.lazy-nvim;
  type = "lua";
  config =
    # lua
    ''
      require("lazy").setup(${formatearComplementosDeLazy complementos})
    '';
}
