{ pkgs, ... }:
let
  tsi = pkgs.vimPlugins.nvim-treesitter-parsers;
in
{
  programs.neovix.lenguajes = {
    "git".gramaticas = with tsi; [
      gitattributes
      git_rebase
      git_config
      gitignore
      gitcommit
    ];
    "http".gramaticas = [ tsi.http ];
    "typescript" = {
      gramaticas = with tsi; [
        typescript
        tsx
      ];
      formateadores = [ "biome" ];
      lsps = [
        "ts_ls"
        "biome"
      ];
    };
    "javascript" = {
      gramaticas = with tsi; [
        javascript
        jsdoc
      ];
      formateadores = [ "biome" ];
      lsps = [
        "ts_ls"
        "biome"
      ];
    };
    "nix" = {
      gramaticas = [ tsi.nix ];
      formateadores = [ "nixfmt" ];
      lsps = [
        "nixd"
        "nil_ls"
      ];
    };
    "qml" = {
      gramaticas = with tsi; [
        qmljs
        qmldir
      ];
      formateadores = [ "qmlformat" ];
    };
    "lua" = {
      gramaticas = with tsi; [
        lua
        luap
        luau
        luadoc
      ];
      formateadores = [ "stylua" ];
      lsps = [ "lua_ls" ];
    };
    "json" = {
      gramaticas = with tsi; [
        json
        json5
        jsonc
        jsonnet
      ];
      formateadores = [ "biome" ];
    };
  };
}
