{ pkgs, lib }: let
  complementos = import ./complementos.nix { inherit pkgs lib; };
in {
  plugin = pkgs.vimPlugins.lazy-nvim;
  type = "lua";
  config = # lua
    ''
      require("lazy").setup({${lib.strings.join ",\n" complementos}})
    '';
}
