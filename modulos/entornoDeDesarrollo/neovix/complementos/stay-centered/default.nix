{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Stay Centered" = {
    paquete = pkgs.vimPlugins.stay-centered-nvim;
    opts = {
      skip_filetypes = [ "dashboard" ];
    };
    configuracion = /* lua */ ''
      require("stay-centered").setup(opts)
    '';
    lazy.eventos = [
      "BufReadPost"
      "BufNewFile"
    ];
  };
}
