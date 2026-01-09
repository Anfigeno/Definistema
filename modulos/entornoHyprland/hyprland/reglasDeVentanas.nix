{ config }:
let
  cfg = config.definistema;

  ventanasTransparentes = [
    {
      clase = "kitty";
      condicion = cfg.kitty.activar;
    }
    {
      clase = "Neovim";
      condicion = cfg.entornoDeDesarrollo.neovim.activar;
    }
  ];
in
[ ]
++ (map (
  ventana: if ventana.condicion then "opacity 0.9, class:${ventana.clase}" else null
) ventanasTransparentes)
