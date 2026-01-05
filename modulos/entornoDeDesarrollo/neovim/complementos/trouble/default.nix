{ pkgs, ... }:
{
  paquete = pkgs.vimPlugins.trouble-nvim;
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "Trouble",
          opts = {
            auto_preview = false
          },
          cmd = "Trouble",
          keys = {
            {
              "<space>td",
              "<cmd>Trouble diagnostics toggle<cr>",
              desc = "Trouble: Diagnosticos",
            },
            {
              "<space>tD",
              "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
              desc = "Trouble: Diagnosticos del buffer",
            }
          },
        }
      end
    '';
}
