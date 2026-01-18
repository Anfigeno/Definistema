{ pkgs, ... }:
{
  programs.neovix.lenguajes = with pkgs.vimPlugins.nvim-treesitter-parsers; {
    "git".gramaticas = [
      gitattributes
      git_rebase
      git_config
      gitignore
      gitcommit
    ];
    "http".gramaticas = [ http ];
    "typescript" = {
      gramaticas = [
        typescript
        tsx
      ];
      formateadores = [ "biome" ];
    };
    "javascript" = {
      gramaticas = [
        javascript
        jsdoc
      ];
      formateadores = [ "biome" ];
    };
    "nix" = {
      gramaticas = [ nix ];
      formateadores = [ "nixfmt" ];
    };
    "qml" = {
      gramaticas = [
        qmljs
        qmldir
      ];
      formateadores = [ "qmlformat" ];
    };
    "lua" = {
      gramaticas = [
        lua
        luap
        luau
        luadoc
      ];
      formateadores = [ "stylua" ];
    };
    "json" = {
      gramaticas = [
        json
        json5
        jsonc
        jsonnet
      ];
      formateadores = [ "biome" ];
    };
  };
}
