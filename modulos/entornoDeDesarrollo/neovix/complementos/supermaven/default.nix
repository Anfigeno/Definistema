{ pkgs, ... }:
{
  programs.neovix.complementos."Supermaven" = {
    paquete = pkgs.vimPlugins.supermaven-nvim;
    configuracion = /* lua */ ''
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-y>",
          clear_suggestion = "<C-e>",
          accept_word = "<C-j>",
        },
      })
    '';
    lazy.eventos = [
      "CmdlineEnter"
      "InsertEnter"
    ];
  };
}
