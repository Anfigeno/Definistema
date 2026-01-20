{
  lib,
  config,
  pkgs,
  ...
}:
let
  inherit (lib) mkEnableOption mkOption types;

  cfg = config.programs.neovix;
in
{
  imports = [
    ./configuracionDeTreesitter.nix
    ./configuracionDeNeoformat.nix
    ./configuracionDeLSPConfig.nix
    ./configuracionDeCodeRunner.nix
  ];

  options.programs.neovix = {
    activar = mkEnableOption "Activar neovix";
    editorPorDefecto = mkEnableOption "Editor por defecto";
    configuracion = mkOption {
      type = types.str;
      default = "";
      description = "Configuracion Lua de Neovim";
    };
    paquetesExtra = mkOption {
      type = types.listOf types.package;
      default = [ ];
      description = "Paquetes adicionales";
    };
    paquetesLuaExtra = mkOption {
      type = types.listOf types.str;
      default = [ ];
      description = "Paquetes adicionales de Lua";
    };
    complementos = mkOption {
      type = types.attrsOf (
        types.submodule {
          options = {
            activar = mkOption {
              type = types.bool;
              default = true;
              description = "Activar complemento";
            };
            paquete = mkOption {
              type = types.package;
              description = "Paquete del complemento";
            };
            dependencias = mkOption {
              type = types.listOf types.package;
              default = [ ];
              description = "Complementos de los que depende el complemento";
            };
            dependenciasDeSistema = mkOption {
              type = types.listOf types.package;
              default = [ ];
              description = "Paquetes de los que depende el complemento";
            };
            dependenciasDeLua = mkOption {
              type = types.listOf types.str;
              default = [ ];
              description = "Paquetes de Lua de los que depende el complemento";
            };
            configuracion = mkOption {
              type = types.str;
              default = "";
              description = "Configuracion Lua del complemento";
            };
            lazy = {
              activar = mkOption {
                type = types.bool;
                default = true;
                description = "Activar carga perezosa del complemento";
              };
              eventos = mkOption {
                type = types.listOf (
                  types.enum [
                    "LspAttach"
                    "VeryLazy"
                    "BufAdd"
                    "BufDelete"
                    "BufEnter"
                    "BufFilePost"
                    "BufFilePre"
                    "BufHidden"
                    "BufLeave"
                    "BufModifiedSet"
                    "BufNew"
                    "BufNewFile"
                    "BufRead"
                    "BufReadPost"
                    "BufReadCmd"
                    "BufReadPre"
                    "BufUnload"
                    "BufWinEnter"
                    "BufWinLeave"
                    "BufWipeout"
                    "BufWrite"
                    "BufWritePre"
                    "BufWriteCmd"
                    "BufWritePost"
                    "ChanInfo"
                    "ChanOpen"
                    "CmdUndefined"
                    "CmdlineChanged"
                    "CmdlineEnter"
                    "CmdlineLeave"
                    "CmdwinEnter"
                    "CmdwinLeave"
                    "ColorScheme"
                    "ColorSchemePre"
                    "CompleteChanged"
                    "CompleteDonePre"
                    "CompleteDone"
                    "CursorHold"
                    "CursorHoldI"
                    "CursorMoved"
                    "CursorMovedI"
                    "DiffUpdated"
                    "DirChanged"
                    "DirChangedPre"
                    "ExitPre"
                    "FileAppendCmd"
                    "FileAppendPost"
                    "FileAppendPre"
                    "FileChangedRO"
                    "FileChangedShell"
                    "FileChangedShellPost"
                    "FileReadCmd"
                    "FileReadPost"
                    "FileReadPre"
                    "FileType"
                    "FileWriteCmd"
                    "FileWritePost"
                    "FileWritePre"
                    "FilterReadPost"
                    "FilterReadPre"
                    "FilterWritePost"
                    "FilterWritePre"
                    "FocusGained"
                    "FocusLost"
                    "FuncUndefined"
                    "UIEnter"
                    "UILeave"
                    "InsertChange"
                    "InsertCharPre"
                    "InsertEnter"
                    "InsertLeavePre"
                    "InsertLeave"
                    "MenuPopup"
                    "ModeChanged"
                    "OptionSet"
                    "QuickFixCmdPre"
                    "QuickFixCmdPost"
                    "QuitPre"
                    "RemoteReply"
                    "SearchWrapped"
                    "RecordingEnter"
                    "RecordingLeave"
                    "SessionLoadPost"
                    "ShellCmdPost"
                    "Signal"
                    "ShellFilterPost"
                    "SourcePre"
                    "SourcePost"
                    "SourceCmd"
                    "SpellFileMissing"
                    "StdinReadPost"
                    "StdinReadPre"
                    "SwapExists"
                    "Syntax"
                    "TabEnter"
                    "TabLeave"
                    "TabNew"
                    "TabNewEntered"
                    "TabClosed"
                    "TermOpen"
                    "TermEnter"
                    "TermLeave"
                    "TermClose"
                    "TermResponse"
                    "TextChanged"
                    "TextChangedI"
                    "TextChangedP"
                    "TextChangedT"
                    "TextYankPost"
                    "User"
                    "UserGettingBored"
                    "VimEnter"
                    "VimLeave"
                    "VimLeavePre"
                    "VimResized"
                    "VimResume"
                    "VimSuspend"
                    "WinClosed"
                    "WinEnter"
                    "WinLeave"
                    "WinNew"
                    "WinScrolled"
                    "WinResized"
                  ]
                );
                default = [ ];
                description = "Eventos que activaran el complemento";
              };
              comandos = mkOption {
                type = types.listOf types.str;
                default = [ ];
                description = "Comandos que activaran el complemento";
              };
              tiposDeArchivo = mkOption {
                type = types.listOf types.str;
                default = [ ];
                description = "Tipos de archivo que activaran el complemento";
              };
              teclas = mkOption {
                type = types.attrsOf (
                  types.submodule {
                    options = {
                      accion = mkOption {
                        type = types.str;
                        default = "";
                        description = "Código Lua a ejecutar";
                      };
                      comando = mkOption {
                        type = types.str;
                        default = "";
                        description = "Comando a ejecutar";
                      };
                      modos = mkOption {
                        type = types.listOf (
                          types.enum [
                            "i"
                            "n"
                            "v"
                            "x"
                            "s"
                            ""
                          ]
                        );
                        default = [ "n" ];
                        description = "Modos en los que se ejecutará el atajo";
                      };
                      descripcion = mkOption {
                        type = types.str;
                        default = "";
                        description = "Descripción del atajo de teclado";
                      };
                    };
                  }
                );
                default = { };
                description = "Atajos de teclado del complemento";
              };
            };
          };
        }
      );
      default = { };
      description = "Complementos de Neovim";
    };
    formateadores = mkOption {
      type = types.nullOr (
        types.attrsOf (
          types.submodule {
            options = {
              paquete = mkOption {
                type = types.nullOr types.package;
                default = null;
                description = "Paquete del formateador";
              };
              configuracion = mkOption {
                type = types.nullOr (types.attrsOf types.anything);
                default = null;
                description = "Configuración del formateador (https://github.com/sbdchd/neoformat)";
              };
            };
          }
        )
      );
      default = null;
      description = "Configuración de formateadores";
    };
    lsps = mkOption {
      type = types.attrsOf (
        types.submodule {
          options = {
            paquete = mkOption {
              type = with types; nullOr package;
              default = null;
              description = "Paquete del LSP del lenguaje";
            };
            configuracion = mkOption {
              type = with types; nullOr (attrsOf anything);
              default = null;
              description = "Configuración del LSP del lenguaje";
            };
          };
        }
      );
      default = { };
      description = "Configuración del LSPs";
    };
    entornosDeEjecucion = mkOption {
      type = types.attrsOf (
        types.submodule {
          options = {
            paquete = mkOption {
              type = types.package;
              description = "Paquete del entorno de ejecución";
            };
            configuracionDeCodeRunner = mkOption {
              type = types.str;
              default = "";
              description = "Configuración de CRAG666/code_runner.nvim";
            };
          };
        }
      );
      default = { };
      description = "Configuración de entornos de ejecución";
    };
    lenguajes = mkOption {
      type = types.attrsOf (
        types.submodule {
          options = {
            activar = mkOption {
              type = types.bool;
              default = true;
              description = "Activar la configuración del lenguaje";
            };
            gramaticas = mkOption {
              type = with types; nullOr (listOf package);
              default = null;
              description = "Paquetes de la gramática de Treesitter";
            };
            formateadores = mkOption {
              type = types.nullOr (types.listOf (types.enum (builtins.attrNames cfg.formateadores)));
              default = null;
              description = "Formateadores activos para este lenguaje";
            };
            lsps = mkOption {
              type = with types; nullOr (listOf (enum (builtins.attrNames cfg.lsps)));
              default = null;
              description = "LSPs activos para este lenguaje";
            };
            entornoDeEjecucion = mkOption {
              type = with types; nullOr (enum (builtins.attrNames cfg.entornosDeEjecucion));
              default = null;
              description = "Entorno de ejecución para este lenguaje";
            };
          };
        }
      );
      default = { };
      description = "Configuración de lenguajes (gramaticas, LSP, formateadores)";
    };
  };

  config = lib.mkIf cfg.activar {
    programs.neovim =
      let
        complementosActivados =
          cfg.complementos
          |> lib.mapAttrsToList (clave: complemento: if !complemento.activar then clave else null)
          |> builtins.filter (x: x != null)
          |> removeAttrs cfg.complementos;
      in
      {
        enable = true;
        defaultEditor = cfg.editorPorDefecto;
        extraLuaConfig = cfg.configuracion;
        extraPackages =
          complementosActivados
          |> lib.mapAttrsToList (_: complemento: complemento.dependenciasDeSistema)
          |> lib.flatten
          |> (x: cfg.paquetesExtra ++ x);
        extraLuaPackages =
          let
            paquetesLuaExtra =
              complementosActivados
              |> lib.mapAttrsToList (_: complemento: complemento.dependenciasDeLua)
              |> lib.lists.flatten;
          in
          ps: paquetesLuaExtra |> map (nombre: ps.${nombre});
        plugins = [
          {
            plugin = pkgs.vimPlugins.lazy-nvim;
            type = "lua";
            config =
              let

                crearPropiedadDeLista = clave: lista: if lista == [ ] then { } else { ${clave} = lista; };

                formatearDependencias =
                  dependencias:
                  dependencias
                  |> map (dependencia: {
                    dir = "${dependencia}";
                  })
                  |> crearPropiedadDeLista "dependencies";

                formatearEventos = eventos: crearPropiedadDeLista "event" eventos;

                formatearTiposDeArchivos = tiposDeArchivo: crearPropiedadDeLista "ft" tiposDeArchivo;

                formatearComandos = comandos: crearPropiedadDeLista "cmd" comandos;

                formatearConfiguracion =
                  configuracion:
                  if configuracion == "" then
                    { }
                  else
                    {
                      config = lib.mkLuaInline /* lua */ ''
                        function()
                          ${configuracion}
                        end
                      '';
                    };

                accionOComando =
                  tecla: with tecla; if accion != "" then /* lua */ ''function() ${accion} end'' else ''"${comando}"'';

                formatearTeclas =
                  teclas:
                  if teclas == { } then
                    { }
                  else
                    {
                      keys =
                        teclas
                        |> lib.mapAttrsToList (
                          clave: tecla:
                          lib.mkLuaInline /* lua */ ''
                            {
                              "${clave}",
                              ${accionOComando tecla},
                              mode = ${lib.generators.toLua { } tecla.modos},
                              desc = "${tecla.descripcion}"
                            } ''
                        );
                    };

                complementosFormateadosParaLazy =
                  complementosActivados
                  |> lib.mapAttrsToList (
                    clave: complemento:
                    with complemento;
                    {
                      dir = "${complemento.paquete}";
                      name = clave;
                      lazy = lazy.activar;
                    }
                    // formatearConfiguracion complemento.configuracion
                    // formatearDependencias dependencias
                    // formatearTiposDeArchivos lazy.tiposDeArchivo
                    // formatearEventos lazy.eventos
                    // formatearComandos lazy.comandos
                    // formatearTeclas lazy.teclas
                  );

                configuracion = {
                  spec = complementosFormateadosParaLazy;
                  checker.enabled = false;
                  pkg.enabled = false;
                  rocks.enabled = false;
                  install.missing = false;
                  change_detection.enabled = false;
                };
              in
              /* lua */ ''
                require("lazy").setup(${lib.generators.toLua { } configuracion})
              '';
          }
        ];
      };
  };
}
