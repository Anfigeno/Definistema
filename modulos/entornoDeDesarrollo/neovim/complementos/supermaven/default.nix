{ pkgs, ... }:
{
  paquete = pkgs.vimPlugins.supermaven-nvim;
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "Supermaven",
          event = "InsertEnter",
          config = function()
            require("supermaven-nvim").setup({
              keymaps = {
                accept_suggestion = "<C-CR>",
                clear_suggestion = "<C-e>",
                accept_word = "<C-j>",
              },
            })
          end
        }
      end
    '';
}
