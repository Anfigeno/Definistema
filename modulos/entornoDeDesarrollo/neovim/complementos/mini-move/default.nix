{ pkgs, ... }:
{
  paquete = pkgs.vimPlugins.mini-move;
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "Mini Move",
          lazy = true,
          config = function()
            require("mini.move").setup({
              mappings = {
                left = "",
                down = "",
                up = "",
                right = "",
                line_left = "",
                line_down = "",
                line_up = "",
                line_right = "",
              },
              options = {
                reindent_linewise = true,
              },
            })
          end,
          keys = {
            {
              "<M-h>",
              function()
                require("mini.move").move_selection("left")
              end,
              desc = "Mini Move: Mover selección a la izquierda",
              mode = "v"
            },
            {
              "<M-j>",
              function()
                require("mini.move").move_selection("down")
              end,
              desc = "Mini Move: Mover selección abajo",
              mode = "v"
            },
            {
              "<M-k>",
              function()
                require("mini.move").move_selection("up")
              end,
              desc = "Mini Move: Mover selección arriba",
              mode = "v"
            },
            {
              "<M-l>",
              function()
                require("mini.move").move_selection("right")
              end,
              desc = "Mini Move: Mover selección a la derecha",
              mode = "v"
            },
            {
              "<M-h>",
              function()
                require("mini.move").move_line("left")
              end,
              desc = "Mini Move: Mover linea a la izquierda",
            },
            {
              "<M-j>",
              function()
                require("mini.move").move_line("down")
              end,
              desc = "Mini Move: Mover linea abajo",
            },
            {
              "<M-k>",
              function()
                require("mini.move").move_line("up")
              end,
              desc = "Mini Move: Mover linea arriba",
            },
            {
              "<M-l>",
              function()
                require("mini.move").move_line("right")
              end,
              desc = "Mini Move: Mover linea a la derecha",
            }
          }
        }
      end
    '';
}
