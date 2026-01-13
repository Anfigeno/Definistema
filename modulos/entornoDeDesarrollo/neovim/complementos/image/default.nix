{ pkgs, deGithub, ... }:
{
  paquete = deGithub {
    rev = "446a8a5cc7a3eae3185ee0c697732c32a5547a0b";
    ref = "master";
    repo = "3rd/image.nvim";
    nvimSkipModules = [ "minimal-setup" ];
  };
  dependenciasDeSistema = with pkgs; [ imagemagick ];
  dependenciasDeLua = [ "magick" ];
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "Image",
          event = "VeryLazy",
          opts = {
            backend = "kitty",
            integrations = {
              markdown = {
                enabled = true,
                clear_in_insert_mode = false,
                download_remote_images = true,
                only_render_image_at_cursor = false,
                filetypes = { "markdown", "vimwiki" },
              },
            },
            max_width = nil,
            max_height = nil,
            max_width_window_percentage = nil,
            max_height_window_percentage = 80,
            kitty_method = "normal",
          },
        }
      end
    '';
}
