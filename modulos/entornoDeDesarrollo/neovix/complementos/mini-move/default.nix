{ pkgs, ... }:
{
  programs.neovix.complementos."Mini Move" = {
    paquete = pkgs.vimPlugins.mini-move;
    configuracion = /* lua */ ''
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
    '';
    lazy.teclas = {
      "<M-h>" = {
        accion = /* lua */ ''
          if vim.fn.mode() == "v" then
            require("mini.move").move_selection("left")
          else
            require("mini.move").move_line("left")
          end
        '';
        descripcion = "Mini Move: Mover a la izquierda";
        modos = [
          "v"
          "n"
        ];
      };
      "<M-j>" = {
        accion = /* lua */ ''
          if vim.fn.mode() == "v" then
            require("mini.move").move_selection("down")
          else
            require("mini.move").move_line("down")
          end
        '';
        descripcion = "Mini Move: Mover abajo";
        modos = [
          "v"
          "n"
        ];
      };
      "<M-k>" = {
        accion = /* lua */ ''
          if vim.fn.mode() == "v" then
            require("mini.move").move_selection("up")
          else
            require("mini.move").move_line("up")
          end
        '';
        descripcion = "Mini Move: Mover arriba";
        modos = [
          "v"
          "n"
        ];
      };
      "<M-l>" = {
        accion = /* lua */ ''
          if vim.fn.mode() == "v" then
            require("mini.move").move_selection("right")
          else
            require("mini.move").move_line("right")
          end
        '';
        descripcion = "Mini Move: Mover a la derecha";
        modos = [
          "v"
          "n"
        ];
      };
    };
  };
}
