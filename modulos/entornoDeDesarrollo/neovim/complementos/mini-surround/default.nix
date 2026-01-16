{ pkgs, ... }:
{
  paquete = pkgs.vimPlugins.mini-surround;
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "Mini Surround",
          config = function()
            require("mini.surround").setup()
          end,
          keys = {
            { "sa", mode = { "n", "v" }, desc = "Mini Surround: Agregar delimitador" },
            { "sd", mode = "n", desc = "Mini Surround: Eliminar delimitador" },
            { "sr", mode = "n", desc = "Mini Surround: Reemplazar delimitador" },
            { "sf", mode = "n", desc = "Mini Surround: Buscar delimitador derecho" },
            { "sF", mode = "n", desc = "Mini Surround: Buscar delimitador izquierdo" },
            { "sh", mode = "n", desc = "Mini Surround: Resaltar delimitador" },
            { "sn", mode = "n", desc = "Mini Surround: Actualizar n_lines" },
          }
        }
      end
    '';
}
