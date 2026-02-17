{ util, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Mestizo 256" = {
    paquete = util.vim.obtenerComplementoDeGithub {
      rev = "5bd3bb1bc235af7d0a0201d1d34badf86b74757a";
      ref = "main";
      repo = "TemaMestizo/Mestizo256.nvim";
    };
    configuracion = /* lua */ ''vim.cmd("colorscheme mestizo256")'';
    lazy.activar = false;
  };
}
