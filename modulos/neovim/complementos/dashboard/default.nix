{ pkgs, formatearDependenciasDeLazy, ... }:
let
  dependencias = with pkgs.vimPlugins; [ nvim-web-devicons ];
  # lua
in ''
  return {
    dir = "${pkgs.vimPlugins.dashboard-nvim}",
    name = "Dashboard",
    event = 'VimEnter',
    dependencies = { ${formatearDependenciasDeLazy dependencias} },
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
''
