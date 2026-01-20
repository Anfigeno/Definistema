{ pkgs, ... }:
{
  programs.neovix.complementos."Tiny Inline Diagnostics" = {
    paquete = pkgs.vimPlugins.tiny-inline-diagnostic-nvim;
    configuracion = /* lua */ ''
      require("tiny-inline-diagnostic").setup({
        options = {
          show_source = { enabled = true },
          add_messages = { display_count = true },
          multilines = { enabled = true },
        },
      })

      vim.diagnostic.config({ virtual_text = false })
    '';
    lazy.eventos = [ "VeryLazy" ];
  };
}
