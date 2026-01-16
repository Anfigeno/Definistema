{ pkgs, ... }:
{
  programs.neovix.complementos."Noice" = {
    paquete = pkgs.vimPlugins.noice-nvim;
    dependencias = with pkgs.vimPlugins; [ nui-nvim ];
    configuracion = /* lua */ ''
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = true,
          lsp_doc_border = false,
        },
      })
    '';
    lazy.eventos = [ "VeryLazy" ];
  };
}
