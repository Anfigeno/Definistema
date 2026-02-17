{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Gitsigns" = {
    paquete = pkgs.vimPlugins.gitsigns-nvim;
    configuracion = /* lua */ ''
      require("gitsigns").setup({
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "right_align",
          delay = 1000,
        },
      })
    '';
    lazy.eventos = [
      "BufReadPre"
      "BufNewFile"
    ];
  };
}
