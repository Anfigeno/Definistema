{ pkgs, lib, ... }:
let
  tsi = pkgs.vimPlugins.nvim-treesitter-parsers;
  configuracionDeLspsComun = {
    capabilities = lib.generators.mkLuaInline /* lua */ ''require("cmp_nvim_lsp").default_capabilities()'';
    on_attach = lib.generators.mkLuaInline /* lua */ ''
      function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, bufnr)
        end
      end'';
  };
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
      lsp."ts_ls" = {
        paquete = pkgs.typescript-language-server;
        configuracion = configuracionDeLspsComun // {
          settings = {
            javascript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true;
                includeInlayFunctionLikeReturnTypeHints = true;
                includeInlayFunctionParameterTypeHints = true;
                includeInlayParameterNameHints = "all";
                includeInlayParameterNameHintsWhenArgumentMatchesName = true;
                includeInlayPropertyDeclarationTypeHints = true;
                includeInlayVariableTypeHints = true;
              };
            };
            typescript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true;
                includeInlayFunctionLikeReturnTypeHints = true;
                includeInlayFunctionParameterTypeHints = true;
                includeInlayParameterNameHints = "all";
                includeInlayParameterNameHintsWhenArgumentMatchesName = true;
                includeInlayPropertyDeclarationTypeHints = true;
                includeInlayVariableTypeHints = true;
              };
            };
          };
        };
      };
    };
    "javascript" = {
      gramaticas = with tsi; [
        javascript
        jsdoc
      ];
      formateadores = [ "biome" ];
    };
    "nix" = {
      gramaticas = [ tsi.nix ];
      formateadores = [ "nixfmt" ];
      lsp = {
        "nixd" = {
          paquete = pkgs.nixd;
          configuracion = configuracionDeLspsComun;
        };
        "nil_ls".paquete = pkgs.nil;
      };
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
      lsp."lua_ls" = {
        paquete = pkgs.lua-language-server;
        configuracion = configuracionDeLspsComun // {
          settings = {
            Lua = {
              hint = {
                enable = true;
                setType = true;
              };
            };
          };
        };
      };
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
