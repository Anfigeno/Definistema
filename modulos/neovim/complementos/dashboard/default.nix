{ pkgs, ... }:
{
  paquete = pkgs.vimPlugins.dashboard-nvim;
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "Dashboard",
          event = "VimEnter",
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
