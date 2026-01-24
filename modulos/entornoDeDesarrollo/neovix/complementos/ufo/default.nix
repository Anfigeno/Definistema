{ pkgs, ... }:
{
  programs.neovix.complementos."Ufo" = {
    paquete = pkgs.vimPlugins.nvim-ufo;
    dependencias = with pkgs.vimPlugins; [
      promise-async
      nvim-treesitter
    ];
    configuracion = /* lua */ ''
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      require("ufo").setup({
        provider_selector = function(_, _, _)
          return { "treesitter", "indent" }
        end,
      })
    '';
    lazy = {
      eventos = [
        "BufReadPost"
        "BufNewFile"
      ];
      teclas = {
        "zR" = {
          accion = /* lua */ ''require("ufo").openAllFolds()'';
          descripcion = "Abre todos los pliegues";
        };
        "zM" = {
          accion = /* lua */ ''require("ufo").closeAllFolds()'';
          descripcion = "Cierra todos los pliegues";
        };
      };
    };
  };
}
