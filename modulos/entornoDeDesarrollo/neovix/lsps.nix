{ pkgs, ... }:
{
  programs.neovix.lspconfig = {
    configuraciones = {
      "nixd".paquete = pkgs.nixd;
      "nil_ls".paquete = pkgs.nil;
      "markdown_oxide".paquete = pkgs.markdown-oxide;
      "solargraph".paquete = pkgs.solargraph;
      "biome".paquete = pkgs.biome;
      "nushell".paquete = pkgs.nushell;
      "cssls".paquete = pkgs.vscode-css-languageserver;
      "fish_lsp".paquete = pkgs.fish-lsp;
      "basedpyright".paquete = pkgs.basedpyright;

      "gopls" = {
        paquete = pkgs.gopls;
        configuracion.settings.gopls."ui.inlayhint.hints" = {
          assignVariableTypes = true;
          compositeLiteralFields = true;
          compositeLiteralTypes = true;
          constantValues = true;
          functionTypeParameters = true;
          parameterNames = true;
          rangeVariableTypes = true;
        };
      };
      "ts_ls" = {
        paquete = pkgs.typescript-language-server;
        configuracion.settings = {
          javascript.inlayHints = {
            includeInlayEnumMemberValueHints = true;
            includeInlayFunctionLikeReturnTypeHints = true;
            includeInlayFunctionParameterTypeHints = true;
            includeInlayParameterNameHints = "all";
            includeInlayParameterNameHintsWhenArgumentMatchesName = true;
            includeInlayPropertyDeclarationTypeHints = true;
            includeInlayVariableTypeHints = true;
          };
          typescript.inlayHints = {
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
      "lua_ls" = {
        paquete = pkgs.lua-language-server;
        configuracion = {
          settings.Lua.hint.enable = true;
          setType = true;
        };
      };
    };
  };
}
