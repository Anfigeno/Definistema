{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.lenguajes = {
    "nu" = {
      gramaticas = with pkgs.vimPlugins.nvim-treesitter-parsers; [ nu ];
      lsps = [ "nushell" ];
      formateadores = [ "nufmt" ];
    };
    "css" = {
      gramaticas = with pkgs.vimPlugins.nvim-treesitter-parsers; [
        css
        scss
      ];
      lsps = [ "cssls" ];
      formateadores = [ "prettierd" ];
    };
    "bash".gramaticas = [ pkgs.vimPlugins.nvim-treesitter-parsers.bash ];
    "fish" = {
      gramaticas = with pkgs.vimPlugins.nvim-treesitter-parsers; [
        fish
      ];
      lsps = [ "fish_lsp" ];
      formateadores = [ "fish_indent" ];
      entornoDeEjecucion = "fish";
    };
    "python" = {
      gramaticas = with pkgs.vimPlugins.nvim-treesitter-parsers; [
        python
      ];
      formateadores = [ "autopep8" ];
      lsps = [ "basedpyright" ];
      entornoDeEjecucion = "python";
    };
    "go" = {
      gramaticas = with pkgs.vimPlugins.nvim-treesitter-parsers; [
        go
        gomod
        gosum
        gotmpl
      ];
      formateadores = [ "gofmt" ];
      lsps = [ "gopls" ];
    };
    "ruby" = {
      gramaticas = with pkgs.vimPlugins.nvim-treesitter-parsers; [
        ruby
        rbs
      ];
      formateadores = [ "rufo" ];
      lsps = [ "solargraph" ];
      entornoDeEjecucion = "ruby";
    };
    "markdown" = {
      gramaticas = with pkgs.vimPlugins.nvim-treesitter-parsers; [
        markdown
        markdown_inline
      ];
      formateadores = [ "mdformat" ];
      lsps = [ "markdown_oxide" ];
    };
    "git".gramaticas = with pkgs.vimPlugins.nvim-treesitter-parsers; [
      gitattributes
      git_rebase
      git_config
      gitignore
      gitcommit
    ];
    "http".gramaticas = [ pkgs.vimPlugins.nvim-treesitter-parsers.http ];
    "typescript" = {
      gramaticas = with pkgs.vimPlugins.nvim-treesitter-parsers; [
        typescript
        tsx
      ];
      formateadores = [ "biome" ];
      lsps = [
        "ts_ls"
        "biome"
      ];
      entornoDeEjecucion = "bun";
    };
    "javascript" = {
      gramaticas = with pkgs.vimPlugins.nvim-treesitter-parsers; [
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
      gramaticas = [ pkgs.vimPlugins.nvim-treesitter-parsers.nix ];
      formateadores = [ "nixfmt" ];
      lsps = [
        "nixd"
        "nil_ls"
      ];
    };
    "qml" = {
      gramaticas = with pkgs.vimPlugins.nvim-treesitter-parsers; [
        qmljs
        qmldir
      ];
      formateadores = [ "qmlformat" ];
    };
    "lua" = {
      gramaticas = with pkgs.vimPlugins.nvim-treesitter-parsers; [
        lua
        luap
        luau
        luadoc
      ];
      formateadores = [ "stylua" ];
      lsps = [ "lua_ls" ];
      entornoDeEjecucion = "lua";
    };
    "json" = {
      gramaticas = with pkgs.vimPlugins.nvim-treesitter-parsers; [
        json
        json5
        jsonc
        jsonnet
      ];
      formateadores = [ "biome" ];
    };
  };
}
