{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Supermaven" = {
    paquete = pkgs.vimPlugins.supermaven-nvim;
    configuracion = /* lua */ ''
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-y>",
          clear_suggestion = "<C-e>",
          accept_word = "<C-j>",
        },
        ignore_filetypes = {
          "neo-tree-popup",
          "neo-tree",
          "telescopeprompt"
        }
      })
    '';
    lazy.eventos = [
      "CmdlineEnter"
      "InsertEnter"
    ];
  };
}
