{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Dashboard" = {
    paquete = pkgs.vimPlugins.dashboard-nvim;
    opts = {
      config = {
        center = [
          { desc = "[ Anfigeno] [ anfigenos] [ Anfigeno]"; }
        ];
      };
    };
    configuracion = /* lua */ ''
      require("dashboard").setup(
        require("mestizo256.integraciones_especiales.dashboard").obtener(opts)
      )
    '';
    lazy.eventos = [ "VimEnter" ];
  };
}
