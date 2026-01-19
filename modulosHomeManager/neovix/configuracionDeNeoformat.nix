{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.programs.neovix;
in
{
  programs.neovix.complementos = lib.mkIf (cfg.activar && cfg.formateadores != null) {
    "Neoformat" =
      let
        lenguajesActivadosYConFormateadores =
          cfg.lenguajes
          |> lib.mapAttrsToList (
            clave: lenguaje: with lenguaje; if !activar || formateadores == null then clave else null
          )
          |> builtins.filter (x: x != null)
          |> removeAttrs cfg.lenguajes;

        formateadoresEnUso =
          lenguajesActivadosYConFormateadores
          |> lib.mapAttrsToList (_: lenguaje: lenguaje.formateadores)
          |> lib.lists.flatten
          |> lib.unique
          |> (
            x:
            cfg.formateadores
            |> lib.mapAttrsToList (
              clave: formateador:
              if !(builtins.elem clave x) then
                null
              else
                {
                  name = clave;
                  value = formateador;
                }
            )
          )
          |> builtins.filter (x: x != null)
          |> lib.listToAttrs;
      in
      {
        paquete = pkgs.vimPlugins.neoformat;
        dependenciasDeSistema =
          formateadoresEnUso
          |> lib.mapAttrsToList (_: formateador: formateador.paquete)
          |> builtins.filter (x: x != null);
        configuracion =
          let
            configuracionLuaDeFormateadores =
              formateadoresEnUso
              |> lib.mapAttrsToList (
                clave: formateador:
                if formateador.configuracion == null then
                  null
                else
                  /* lua */ ''local configuracion_${clave} = ${
                    formateador.configuracion |> lib.generators.toLua { }
                  }''
              )
              |> builtins.filter (x: x != null)
              |> builtins.concatStringsSep "\n";

            formateadoresConfiguradosParaCadaLenguaje =
              lenguajesActivadosYConFormateadores
              |> lib.mapAttrsToList (
                clave: lenguaje:
                lenguaje.formateadores
                |> map (
                  nombreDeFormateador:
                  /* lua */ ''vim.g.neoformat_${clave}_${nombreDeFormateador} = configuracion_${nombreDeFormateador}''
                )
              )
              |> lib.lists.flatten
              |> builtins.concatStringsSep "\n";

            formateadoresActivadosParaCajaLenguaje =
              lenguajesActivadosYConFormateadores
              |> lib.mapAttrsToList (
                clave: lenguaje:
                /* lua */ ''vim.g.neoformat_${clave}_enabled = ${
                  lenguaje.formateadores |> lib.generators.toLua { multiline = false; }
                } ''
              )
              |> builtins.concatStringsSep "\n";

            configuracion =
              [
                configuracionLuaDeFormateadores
                formateadoresConfiguradosParaCadaLenguaje
                formateadoresActivadosParaCajaLenguaje
              ]
              |> builtins.concatStringsSep "\n\n";
          in
          configuracion;

        lazy = {
          comandos = [ "Neoformat" ];
          teclas = {
            "<s-f>" = {
              comando = "<cmd>Neoformat<cr>";
              descripcion = "Formatea el buffer";
            };
          };
        };
      };
  };
}
