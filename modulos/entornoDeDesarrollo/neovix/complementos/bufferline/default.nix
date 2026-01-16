{ pkgs, ... }:
{
  programs.neovix.complementos."Bufferline" = {
    paquete = pkgs.vimPlugins.bufferline-nvim;
    dependencias = with pkgs.vimPlugins; [ scope-nvim ];
    configuracion = /* lua */ ''
      require("scope").setup({})

      require("bufferline").setup({
        highlights = require("mestizo.claves.integraciones.especial.bufferline"),
        options = {
          offsets = {
            {
              filetype = "fyler",
              text = "Archivos",
              highlight = "Normal",
              text_align = "center",
              separator = true,
            },
          },
        },
      })
    '';
    lazy = {
      eventos = [ "BufEnter" ];
      teclas = {
        "<tab>" = {
          accion = /* lua */ ''
            require("bufferline").cycle(1)
          '';
          descripcion = "Bufferline: Siguiente buffer";
        };
        "<s-tab>" = {
          accion = /* lua */ ''
            require("bufferline").cycle(-1)
          '';
          descripcion = "Bufferline: Anterior buffer";
        };
        "<space>x" = {
          comando = "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>";
          descripcion = "Bufferline: Cerrar buffer";
        };
        "<c-t>" = {
          comando = "<cmd>tabnew<cr>";
          descripcion = "Nueva pestaña";
        };
        "<m-tab>" = {
          comando = "<cmd>tabnext<cr>";
          descripcion = "Siguiente pestaña";
        };
      };
    };
  };
}
