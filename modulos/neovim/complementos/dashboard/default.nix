{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.dashboard-nvim;
  dependencias = with pkgs.vimPlugins; [ nvim-web-devicons ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias string[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "Dashboard",
          event = "VimEnter",
          dependencies = dependencias,
          config = function()
            require("dashboard").setup({
              theme = "doom",
              config = {
                header = {
                  "",
                  "",
                  "",
                  " 	       ████ ██████           █████      ██                     ",
                  " 	      ███████████             █████                             ",
                  " 	      █████████ ███████████████████ ███   ███████████   ",
                  " 	     █████████  ███    █████████████ █████ ██████████████   ",
                  " 	    █████████ ██████████ █████████ █████ █████ ████ █████   ",
                  " 	  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
                  " 	 ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
                  "",
                },
                week_header = {
                  enable = false,
                },
                center = {
                  { desc = "[ Anfigeno] [ anfigenos] [ Anfigeno]" },
                },
              },
            })
          end
        }
      end
    '';
}
