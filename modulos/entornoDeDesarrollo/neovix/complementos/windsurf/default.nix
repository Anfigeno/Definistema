{
  pkgs,
  usuario,
  config,
  ...
}:
{
  home-manager.users.${usuario}.programs.neovix.complementos = {
    "Windsurf" = {
      activar = false;
      paquete = pkgs.vimPlugins.windsurf-nvim;
      dependencias = with pkgs.vimPlugins; [
        plenary-nvim
        blink-cmp
        nvim-cmp
      ];
      opts = { };
      configuracion = /* lua */ ''require("codeium").setup(opts)'';
      lazy.activar = false;
    };

    "Blink".opts.sources =
      if !config.home-manager.users.${usuario}.programs.neovix.complementos."Windsurf".activar then
        { }
      else
        {
          default = [ "codeium" ];
          providers = {
            codeium = {
              name = "Codeium";
              module = "codeium.blink";
              async = true;
            };
          };
        };
  };
}
