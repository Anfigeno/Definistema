{ pkgs, deGithub, ... }:
{
  paquete = deGithub {
    rev = "4dfc8758a1deab45e37b7f3661e0fd3759d85788";
    ref = "main";
    repo = "NotAShelf/direnv.nvim";
  };
  dependenciasDeSistema = [ pkgs.direnv ];
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "Direnv",
          event = { "BufReadPre", "BufNewFile" },
          config = function ()
            require("direnv").setup({
              bin = "${pkgs.direnv}/bin/direnv",
              statusline = { enabled = true, icon = "󱚟 " }
            })
          end,
          keys = {
            {
              "<space>da",
              function()
                require("direnv").allow_direnv()
              end,
              desc = "Direnv: Permitir"
            },
            {
              "<space>dd",
              function()
                require("direnv").deny_direnv()
              end,
              desc = "Direnv: Denegar"
            },
            {
              "<space>dr",
              function()
                require("direnv").check_direnv()
              end,
              desc = "Direnv: Recargar"
            },
            {
              "<space>de",
              function()
                require("direnv").edit_envrc()
              end,
              desc = "Direnv: Editar .envrc"
            },
          }
        }
      end
    '';
}
