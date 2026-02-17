{ config }:
let
  cfg = config.definistema;

  ventanasTransparentes = [
    # {
    #   clase = "kitty";
    #   condicion = cfg.kitty.activar;
    # }
    {
      clase = "Neovim";
      condicion = cfg.entornoDeDesarrollo.neovix.activar;
    }
  ];
in
ventanasTransparentes
|> map (ventana: if ventana.condicion then "opacity 0.9, class:${ventana.clase}" else "")
|> builtins.filter (x: x != "")
