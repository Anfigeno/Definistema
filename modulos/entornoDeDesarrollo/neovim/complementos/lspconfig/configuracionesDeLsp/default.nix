builtins.concatStringsSep "\n" (
  map (configuracion: import configuracion) [
    ./nixd.nix
    ./gopls.nix
    ./luals.nix
    ./ts_ls.nix
    ./nil_ls.nix
    ./otter-ls.nix
  ]
)
