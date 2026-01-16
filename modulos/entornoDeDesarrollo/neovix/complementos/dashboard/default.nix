{ pkgs, ... }:
{
  programs.neovix.complementos."Dashboard Nvim" = {
    paquete = pkgs.vimPlugins.dashboard-nvim;
    configuracion = /* lua */ ''
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
    '';
    lazy.eventos = [ "VimEnter" ];
  };
}
