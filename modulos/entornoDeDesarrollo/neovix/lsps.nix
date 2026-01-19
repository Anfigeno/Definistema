{ pkgs, lib, ... }:
{
  programs.neovix.lsps =
    let
      inherit (lib.generators) mkLuaInline;

      configuracionDeLspsComun = {
        capabilities = mkLuaInline /* lua */ ''require("cmp_nvim_lsp").default_capabilities()'';
        on_attach = mkLuaInline /* lua */ ''
          function(client, bufnr)
            if client.server_capabilities.documentSymbolProvider then
              require("nvim-navic").attach(client, bufnr)
            end
          end'';
      };
    in
    {
      "nixd" = {
        paquete = pkgs.nixd;
        configuracion = configuracionDeLspsComun;
      };
      "nil_ls".paquete = pkgs.nil;
      "ts_ls" = {
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
      "biome".paquete = pkgs.biome;
      "lua_ls" = {
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
}
