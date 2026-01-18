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
      type = types.attrsOf (
        types.submodule {
          options = {
            activar = mkOption {
              type = types.bool;
              default = true;
              description = "Activar el formateador";
            };
            paquete = mkOption {
              type = types.nullOr types.package;
              default = null;
              description = "Paquete del formateador";
            };
            configuracion = mkOption {
              type = types.attrsOf types.anything;
              description = "Configuración del formateador";
            };
          };
        }
      );
      default = { };
      description = "Configuración de formateadores";
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
              type = types.listOf types.package;
              default = [ ];
              description = "Paquetes de la gramática de Treesitter";
            };
            formateadores = mkOption {
              type = types.nullOr (types.listOf (types.enum (builtins.attrNames cfg.formateadores)));
              default = null;
              description = "Formateadores activos para este lenguaje";
            };
            lsp = mkOption {
              type = types.attrsOf (
                types.submodule {
                  options = {
                    activar = mkOption {
                      type = types.bool;
                      default = true;
                      description = "Activar el LSP del lenguaje";
                    };
                    paquete = mkOption {
                      type = types.nullOr types.package;
                      default = null;
                      description = "Paquete del LSP del lenguaje";
                    };
                    configuracion = mkOption {
                      type = types.nullOr types.anything;
                      default = null;
                      description = "Configuración del LSP del lenguaje";
                    };
                  };
                }
              );
              default = { };
              description = "Configuración del LSP del lenguaje";
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
        nombresDeComplementos = builtins.attrNames cfg.complementos;
      in
      {
        enable = true;
        defaultEditor = cfg.editorPorDefecto;
        extraLuaConfig = cfg.configuracion;
        extraPackages =
          cfg.paquetesExtra
          ++ (lib.lists.flatten (
            map (
              nombre:
              let
                complemento = cfg.complementos.${nombre};
              in
              if complemento.activar then complemento.dependenciasDeSistema else [ ]
            ) nombresDeComplementos
          ));
        extraLuaPackages =
          let
            paquetesLuaExtraDeComplementos = lib.lists.flatten (
              map (
                nombre:
                let
                  complemento = cfg.complementos.${nombre};
                in
                if complemento.activar then complemento.dependenciasDeLua else [ ]
              ) nombresDeComplementos
            );
            paquetesLuaExtra = cfg.paquetesLuaExtra ++ paquetesLuaExtraDeComplementos;
          in
          ps: map (nombre: ps.${nombre}) paquetesLuaExtra;
        plugins = [
          {
            plugin = pkgs.vimPlugins.lazy-nvim;
            type = "lua";
            config =
              let
                inherit (import ./util.nix { inherit lib; }) construirTablaDeLua aLua;

                formatearDependencias =
                  dependencias:
                  if dependencias == [ ] then
                    ""
                  else
                    /* lua */ ''
                      dependencies =
                        ${construirTablaDeLua (map (dependencia: /* lua */ ''{ dir = "${dependencia}" }'') dependencias)}
                    '';

                formatearEventos =
                  eventos:
                  if eventos == [ ] then
                    ""
                  else
                    /* lua */ ''
                      event = ${aLua eventos}
                    '';

                formatearComandos =
                  comandos:
                  if comandos == [ ] then
                    ""
                  else
                    /* lua */ ''
                      cmd = ${aLua comandos}
                    '';

                formatearTiposDeArchivo =
                  tiposDeArchivo:
                  if tiposDeArchivo == [ ] then
                    ""
                  else
                    /* lua */ ''
                      ft = ${aLua tiposDeArchivo}
                    '';

                accionComandoONada =
                  accion: comando:
                  if accion == "" && comando == "" then
                    ""
                  else if accion != "" then
                    /* lua */ ''
                      function()
                        ${accion}
                      end
                    ''
                  else
                    ''"${comando}"'';

                descripcionONada = descripcion: if descripcion == "" then "" else ''desc = "${descripcion}"'';

                formatearTeclasDeComplemento =
                  teclas: # lua
                  if teclas == { } then
                    ""
                  else
                    /* lua */ ''
                      keys = ${
                        construirTablaDeLua (
                          map (
                            nombre:
                            let
                              tecla = teclas.${nombre};
                            in
                            with tecla;
                            construirTablaDeLua [
                              ''"${nombre}"''
                              (accionComandoONada accion comando)
                              (descripcionONada descripcion)
                              ''mode = ${aLua modos}''
                            ]
                          ) (builtins.attrNames teclas)
                        )
                      }
                    '';

                nombreONada = nombre: if nombre != "" then ''name = "${nombre}"'' else "";

                configuracionONada =
                  configuracion:
                  if configuracion != "" then
                    /* lua */ ''
                      config = function()
                        ${configuracion}
                      end''
                  else
                    "";

                formatearComplementoDeLua =
                  nombre: complemento:
                  with complemento; # lua
                  construirTablaDeLua [
                    ''dir = "${paquete}"''
                    (nombreONada nombre)
                    (formatearDependencias dependencias)
                    ''lazy = ${if lazy.activar then "true" else "false"}''
                    (formatearEventos lazy.eventos)
                    (formatearComandos lazy.comandos)
                    (formatearTiposDeArchivo lazy.tiposDeArchivo)
                    (configuracionONada configuracion)
                    (formatearTeclasDeComplemento lazy.teclas)
                  ];

                complementosFormateadosALua = construirTablaDeLua (
                  map (
                    nombre:
                    let
                      complemento = cfg.complementos.${nombre};
                    in
                    if complemento.activar then formatearComplementoDeLua nombre complemento else ""
                  ) nombresDeComplementos
                );
              in
              /* lua */ ''
                require("lazy").setup({
                  spec = ${complementosFormateadosALua},
                  checker = { enabled = false },
                  pkg = { enabled = false },
                  rocks = { enabled = false },
                  install = { missing = false },
                  change_detection = { enabled = false }
                })
              '';
          }
        ];
      };
  };
}
