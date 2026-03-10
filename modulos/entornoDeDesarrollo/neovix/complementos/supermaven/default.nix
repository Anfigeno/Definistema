{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Supermaven" = {
    paquete = pkgs.vimPlugins.supermaven-nvim;
    opts = {
      keymaps = {
        accept_suggestion = "<C-y>";
        clear_suggestion = "<C-e>";
        accept_word = "<C-j>";
      };
      ignore_filetypes = [
        "neo-tree-popup"
        "neo-tree"
        "telescopeprompt"
      ];
    };
    configuracion = /* lua */ ''require("supermaven-nvim").setup(opts)'';
    lazy = {
      eventos = [
        "CmdlineEnter"
        "InsertEnter"
      ];
      teclas."<space>st" = {
        comando = "<cmd>Supermaven toggle<cr>";
        descripcion = "Supermaven: Activar/desactivar";
      };
    };
  };
}
