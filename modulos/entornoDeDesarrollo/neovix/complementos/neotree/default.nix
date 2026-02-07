{ pkgs, ... }:
{
  programs.neovix.complementos."Neo Tree" = {
    paquete = pkgs.vimPlugins.neo-tree-nvim;
    dependencias = with pkgs.vimPlugins; [
      mini-icons
      plenary-nvim
      nui-nvim
    ];
    configuracion = /* lua */ ''
      require("neo-tree").setup {
        popup_border_style = "",
        window = { width = 50 },
        event_handlers = {
          {
            event = "file_open_requested",
            handler = function()
              vim.cmd("Neotree close")
            end
          },
        }
      }
    '';
    lazy = {
      activar = false;
      teclas = {
        "<C-n>" = {
          comando = /* vim */ "<cmd>Neotree toggle<cr>";
          descripcion = "Neo Tree: Alternar explorador";
        };
      };
    };
  };
}
