{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.neoformat;
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "Neoformat",
          cmd = { "Neoformat" },
          config = function()
            vim.g.neoformat_run_all_formatters = 1

            local formateadores = {
              biome = {
                exe = "biome",
                try_node_exe = 1,
                args = { "format", '--stdin-file-path="%:p"' },
                no_append = 1,
                stdin = 1,
              },
              prettierd = {
                exe = "prettierd",
                args = { '"%:p"' },
                stdin = 1,
              },
              qmlformat = {
                exe = "qmlformat",
                args = { '"%:p"' },
                stdin = 1,
              },
            }

            -- NOTA: JavaScript
            local formateadores_para_js = { "biome" }
            vim.g.neoformat_enabled_typescript = formateadores_para_js
            vim.g.neoformat_enabled_javascript = formateadores_para_js
            vim.g.neoformat_enabled_json = formateadores_para_js

            -- NOTA: Astro
            vim.g.neoformat_enabled_astro = { "prettierd", "biome" }
            vim.g.neoformat_astro_prettierd = formateadores.prettierd
            vim.g.neoformat_astro_biome = formateadores.biome

            -- NOTA: Svelte
            vim.g.neoformat_enabled_svelte = { "prettierd", "biome" }
            vim.g.neoformat_svelte_prettierd = formateadores.prettierd
            vim.g.neoformat_svelte_biome = formateadores.biome

            -- NOTA: Qml
            vim.g.neoformat_enabled_qml = { "qmlformat" }
            vim.g.neoformat_qml_qmlformat = formateadores.qmlformat
          end,
          keys = {
            {
              "<s-f>",
              "<cmd>Neoformat<cr>",
              desc = "Formatea el buffer",
            },
          },
        }
      end
    '';
}
