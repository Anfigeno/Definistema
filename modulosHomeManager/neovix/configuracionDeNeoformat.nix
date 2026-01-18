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
  programs.neovix.complementos."Neoformat" =
    let
      inherit (import ./util.nix { inherit lib; }) mapSin aLua;
    in
    {
      paquete = pkgs.vimPlugins.neoformat;
      dependenciasDeSistema =
        let
          todosLosFormateadores =
            if cfg.formateadores == { } then
              [ ]
            else
              mapSin null (builtins.attrNames cfg.formateadores) (
                nombre:
                let
                  formateador = cfg.formateadores.${nombre};
                in
                with formateador;
                if activar then paquete else null
              );
        in
        todosLosFormateadores;
      configuracion =
        let

          configuracionDeFormateadores = mapSin null (builtins.attrNames cfg.formateadores) (
            nombre:
            let
              formateador = cfg.formateadores.${nombre};
            in
            with formateador;
            if configuracion == null then
              null
            else
              /* lua */ ''
                local configuracion_${nombre} = ${aLua configuracion}
              ''
          );

          formateadoresConfiguradosParaCadaLenguaje = mapSin null (builtins.attrNames cfg.lenguajes) (
            nombre:
            let
              lenguaje = cfg.lenguajes.${nombre};
            in
            with lenguaje;
            if !activar || formateadores == null then
              null
            else
              builtins.concatStringsSep "\n" (
                map (
                  formateador: ''vim.g.neoformat_${nombre}_${formateador} = configuracion_${formateador}''
                ) formateadores
              )
          );

          formateadoresHabilitadosParaCadaLenguaje = mapSin null (builtins.attrNames cfg.lenguajes) (
            nombreDeLenguaje:
            let
              lenguaje = cfg.lenguajes.${nombreDeLenguaje};

              formateadoresActivados =
                if lenguaje.formateadores == null then
                  null
                else
                  mapSin null lenguaje.formateadores (
                    nombreDeFormateador:
                    let
                      formateador = cfg.formateadores.${nombreDeFormateador};
                    in
                    if !formateador.activar then null else nombreDeFormateador
                  );
            in
            with lenguaje;
            if !activar || formateadoresActivados == null then
              null
            else
              /* lua */ ''vim.g.neoformat_enabled_${nombreDeLenguaje} = ${aLua formateadoresActivados} ''
          );
        in
        /* lua */ ''
          vim.g.neoformat_run_all_formatters = 1

          ${builtins.concatStringsSep "\n" configuracionDeFormateadores}

          ${builtins.concatStringsSep "\n" formateadoresConfiguradosParaCadaLenguaje}

          ${builtins.concatStringsSep "\n" formateadoresHabilitadosParaCadaLenguaje}
        '';
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
}
