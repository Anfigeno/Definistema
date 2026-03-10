{
  util,
  usuario,
  config,
  ...
}:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Reactive" = {
    paquete = util.vim.obtenerComplementoDeGithub {
      rev = "0588b5c2b0cf49bd2232fe4366b3516c32edee44";
      ref = "main";
      repo = "rasulomaroff/reactive.nvim";
    };
    dependencias = [
      config.home-manager.users.${usuario}.programs.neovix.complementos."Mestizo 256".paquete
    ];
    opts = {
      load = "mestizo256";
    };
    configuracion = /* lua */ ''require("reactive").setup(opts)'';
    lazy.activar = false;
  };
}
