{ pkgs, ... }:
{
  programs.neovix.complementos."Telescope" = {
    paquete = pkgs.vimPlugins.telescope-nvim;
    dependencias = with pkgs.vimPlugins; [ plenary-nvim ];
    dependenciasDeSistema = [ pkgs.ripgrep ];
    configuracion = /* lua */ ''
      require("telescope").setup({
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",

          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = "top",
            },
            height = 0.80,
          },
        },
      })
    '';
    lazy.teclas = {
      "<space>ff" = {
        accion = /* lua */ ''require("telescope.builtin").find_files()'';
        descripcion = "Telescope: Encontrar archivos";
      };
      "<space>fg" = {
        accion = /* lua */ ''require("telescope.builtin").live_grep()'';
        descripcion = "Telescope: Grep";
      };
      "<space>fs" = {
        accion = /* lua */ ''require("telescope.builtin").lsp_document_symbols()'';
        descripcion = "Telescope: Simbolos";
      };
      "<space>fr" = {
        accion = /* lua */ ''require("telescope.builtin").lsp_references()'';
        descripcion = "Telescope: Encontrar referencias";
      };
    };
  };
}
