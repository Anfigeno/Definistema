{
  pkgs,
  usuario,
  lib,
  ...
}:
{
  home-manager.users.${usuario}.programs.neovix.complementos = {
    "LSP File Operations".dependencias = [
      pkgs.vimPlugins.neo-tree-nvim
    ];
    "Neo Tree" = {
      paquete = pkgs.vimPlugins.neo-tree-nvim;
      dependencias = with pkgs.vimPlugins; [
        mini-icons
        plenary-nvim
        nui-nvim
      ];
      opts = {
        popup_border_style = "rounded";
        window = {
          width = 50;
        };
        event_handlers = [
          {
            event = "file_open_requested";
            handler = lib.mkLuaInline /* lua */ ''
              function()
                vim.cmd("Neotree close")
              end
            '';
          }
        ];
      };
      configuracion = /* lua */ ''require("neo-tree").setup(opts)'';
      lazy = {
        activar = false;
        teclas = {
          "<C-n>" = {
            comando = /* vim */ "<cmd>Neotree reveal toggle<cr>";
            descripcion = "Neo Tree: Alternar explorador";
          };
        };
      };
    };
  };
}
