{ pkgs, formatearDependenciasDeLazy, ... }:
let
  dependencias = with pkgs.vimPlugins; [ cmp-nvim-lsp ];

  nombresDeConfiguraciondeLsp = [
    "luals"
    "gopls"
    "ts_ls"
    "nil_ls"
    "nixd"
    "otter-ls"
  ];

  configuracionesDeLsp = builtins.concatStringsSep "\n" (
    map (nombre: import ./configuracionesDeLsp/${nombre}.nix) nombresDeConfiguraciondeLsp
  );
  # lua
in
''
  return {
    dir = "${pkgs.vimPlugins.nvim-lspconfig}",
    name = "LSP Config",
    event = { "BufReadPre", "BufNewFile" },
    dependencias = { ${formatearDependenciasDeLazy dependencias} }, -- luacheck: ignore
    config = function()
      local lsps = {}
      ${configuracionesDeLsp} -- luacheck: ignore

      local config_por_defecto = {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function(client, bufnr)
          if client.server_capabilities.documentSymbolProvider then
            require("nvim-navic").attach(client, bufnr)
          end
        end
      }

      local fusionar_tablas = function(tabla_a, tabla_b)
        for clave, valor in pairs(tabla_b) do
          tabla_a[clave] = valor
        end
      end

      local nombres_de_lsp = {}
      for nombre, config in pairs(lsps) do
        fusionar_tablas(config, config_por_defecto)
        vim.lsp.config(nombre, config)
        table.insert(nombres_de_lsp, nombre)
      end
      vim.lsp.enable(nombres_de_lsp)

      vim.diagnostic.config({
        virtual_lines = true,
        float = {
          border = "single",
          format = function(diagnostic)
            return string.format(
              "%s (%s) [%s]",
              diagnostic.message,
              diagnostic.source,
              diagnostic.code or diagnostic.user_data.lsp.code
            )
          end,
        },
      })
    end
  }
''
