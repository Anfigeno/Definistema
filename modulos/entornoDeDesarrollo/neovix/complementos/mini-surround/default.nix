{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Mini Surround" = {
    paquete = pkgs.vimPlugins.mini-surround;
    opts = { };
    configuracion = /* lua */ ''require("mini.surround").setup(opts)'';
    lazy.teclas = {
      "sa" = {
        accion = /* lua */ ''require("mini.surround").add({ forward = true })'';
        descripcion = "Mini Surround: Agregar delimitador";
        modos = [
          "n"
          "v"
        ];
      };
    };
  };
}
