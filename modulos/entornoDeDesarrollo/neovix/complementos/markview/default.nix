{ pkgs, lib, ... }:
{
  programs.neovix.complementos."Markview" = {
    paquete = (import ../../util/deGithub.nix { inherit pkgs lib; }) {
      rev = "18fc148c83925919d94f3fc8e5c74f2d108b9b44";
      ref = "main";
      repo = "OXY2DEV/markview.nvim";
    };
    dependencias = with pkgs.vimPlugins; [ mini-icons ];
    configuracion = /* lua */ ''
      require("markview").setup({
        preview = {
          icon_provider = "mini",
        }
      })
    '';
    lazy.activar = false;
  };
}
