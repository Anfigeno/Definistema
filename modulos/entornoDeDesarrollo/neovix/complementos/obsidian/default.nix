{ pkgs, lib, ... }:
{
  programs.neovix.complementos."Obsidian" = {
    paquete = pkgs.vimPlugins.obsidian-nvim;
    dependencias = with pkgs.vimPlugins; [
      telescope-nvim
      blink-cmp
    ];
    configuracion = /* lua */ ''
      require("obsidian").setup({
        workspaces = {
          {
            name = "Defecto",
            path = "~/Vaul/Defecto"
          }
        }
      })
    '';
    lazy.tiposDeArchivo = [ "markdown" ];
  };
}
