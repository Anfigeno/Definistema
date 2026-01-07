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
      require("lazy").setup({
        spec = ${formatearComplementosDeLazy complementos},
        checker = { enabled = false },
        pkgs = { enabled = false },
        rocks = { enabled = false },
        install = { missing = false },
        change_detection = { enabled = false }
      })
    '';
}
