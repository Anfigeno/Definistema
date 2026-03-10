{
  pkgs,
  util,
  usuario,
  ...
}:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Image" = {
    paquete = util.vim.obtenerComplementoDeGithub {
      rev = "446a8a5cc7a3eae3185ee0c697732c32a5547a0b";
      ref = "master";
      repo = "3rd/image.nvim";
      nvimSkipModules = [ "minimal-setup" ];
    };
    dependenciasDeSistema = with pkgs; [ imagemagick ];
    dependenciasDeLua = [ "magick" ];
    opts = {
      backend = "kitty";
      integrations = {
        markdown = {
          enabled = true;
          clear_in_insert_mode = false;
          download_remote_images = true;
          only_render_image_at_cursor = false;
          filetypes = [
            "markdown"
            "vimwiki"
          ];
        };
      };
      max_width = null;
      max_height = null;
      max_width_window_percentage = null;
      max_height_window_percentage = 80;
      kitty_method = "normal";
    };
    configuracion = /* lua */ ''require("image").setup(opts)'';
    lazy.eventos = [ "VeryLazy" ];
  };
}
