{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."TS Autotag" = {
    paquete = pkgs.vimPlugins.ts-autotag-nvim;
    opts = {
      auto_rename = {
        enable = true;
      };
    };
    configuracion = /* lua */ ''require("ts-autotag").setup(opts)'';
    lazy.activar = false;
  };
}
