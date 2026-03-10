{
  pkgs,
  util,
  usuario,
  ...
}:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Markview" = {
    paquete = util.vim.obtenerComplementoDeGithub {
      rev = "18fc148c83925919d94f3fc8e5c74f2d108b9b44";
      ref = "main";
      repo = "OXY2DEV/markview.nvim";
    };
    dependencias = with pkgs.vimPlugins; [ mini-icons ];
    opts = {
      preview = {
        icon_provider = "mini";
      };
    };
    configuracion = /* lua */ ''require("markview").setup(opts)'';
    lazy.activar = false;
  };
}
