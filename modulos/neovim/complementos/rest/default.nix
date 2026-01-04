{ pkgs, ... }:
{
  paquete = pkgs.vimPlugins.rest-nvim;
  dependencias = with pkgs.vimPlugins; [
    telescope-nvim
    nvim-treesitter
    nvim-nio
  ];
  dependenciasDeSistema = with pkgs; [ curl ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias { dir: string }[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "Rest",
          ft = "http",
          dependencies = dependencias,
          config = function()
            require("telescope").load_extension("rest")
          end,
          keys = {
            {
              "<space>fR",
              function ()
                require("telescope").extensions.rest.select_env()
              end,
              desc = "Telescope: Seleccionar entorno de REST"
            },
            {
              "<space>rr",
              "<cmd>Rest run<cr>",
              desc = "Rest: Ejecutar petición"
            },
            {
              "<space>ra",
              "<cmd>Rest open<cr>",
              desc = "Rest: Abrir panel de resultados"
            },
            {
              "<space>ru",
              "<cmd>Rest last<cr>",
              desc = "Rest: Ejecutar última petición"
            }
          }
        }
      end
    '';
}
