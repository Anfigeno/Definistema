{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Hlchunk" = {
    paquete = pkgs.vimPlugins.hlchunk-nvim;
    opts = { };
    configuracion = /* lua */ ''
      require("hlchunk").setup(
        require("mestizo256.integraciones_especiales.hlchunk").obtener(opts)
      )
    '';
    lazy.eventos = [
      "BufReadPre"
      "BufNewFile"
    ];
  };
}
