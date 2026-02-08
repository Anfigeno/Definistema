{ pkgs, ... }:
{
  programs.neovix.complementos."Hlchunk" = {
    paquete = pkgs.vimPlugins.hlchunk-nvim;
    configuracion = /* lua */ ''
      require("hlchunk").setup({
        chunk = {
          enable = true,
          style = require("mestizo256").integraciones_especiales.hlchunk,
        },
      })
    '';
    lazy.eventos = [
      "BufReadPre"
      "BufNewFile"
    ];
  };
}
