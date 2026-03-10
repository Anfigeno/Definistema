{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Satellite" = {
    paquete = pkgs.vimPlugins.satellite-nvim;
    opts = {
      exclude_filetypes = [
        "fyler"
        "Telescope"
        "Outline"
        "neo-tree"
        "toggleterm"
        "dashboard"
      ];
    };
    configuracion = /* lua */ ''require("satellite").setup(opts)'';
    lazy.eventos = [
      "BufReadPost"
      "BufNewFile"
    ];
  };
}
