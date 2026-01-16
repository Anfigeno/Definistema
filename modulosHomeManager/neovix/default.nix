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
                formatearDependenciasDeComplemento =
                  dependencias:
                  if dependencias == [ ] then
                    ""
                  else
                    /* lua */ ''
                      dependencies = {
                        ${builtins.concatStringsSep ",\n" (
                          map (dependencia: /* lua */ ''{ dir = "${dependencia}"}'') dependencias
                        )}
                      },
                    '';

                formatearEventosDeComplemento =
                  eventos:
                  if eventos == [ ] then
                    ""
                  else
                    /* lua */ ''
                      event = ${lib.generators.toLua { } eventos},
                    '';

                formatearComandosDeComplemento =
                  comandos:
                  if comandos == [ ] then
                    ""
                  else
                    /* lua */ ''
                      cmd = ${lib.generators.toLua { } comandos},
                    '';

                formatearTiposDeArchivoDeComplemento =
                  tiposDeArchivo:
                  if tiposDeArchivo == [ ] then
                    ""
                  else
                    /* lua */ ''
                      ft = ${lib.generators.toLua { } tiposDeArchivo},
                    '';

                accionOComando =
                  accion: comando:
                  assert (accion != "" || comando != "");
                  if accion != "" then
                    /* lua */ ''
                      function()
                        ${accion}
                      end
                    ''
                  else
                    ''"${comando}"'';

                formatearTeclasDeComplemento =
                  teclas: # lua
                  if teclas == { } then
                    ""
                  else
                    /* lua */ ''
                       keys = {
                         ${builtins.concatStringsSep "\n," (
                           map (
                             nombre:
                             let
                               tecla = teclas.${nombre};
                             in
                             with tecla;
                             /* lua */ ''
                               {
                                 "${nombre}",
                                 ${accionOComando accion comando},
                                  desc = "${descripcion}",
                                  mode = ${lib.generators.toLua { } modos}
                               }''
                           ) (builtins.attrNames teclas)
                         )}
                      },
                    '';

                nombreONo = nombre: if nombre != "" then /* lua */ ''name = "${nombre}"'' else "";
                configuracionONo =
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
                  ''
                    {
                      dir = "${paquete}",
                      ${nombreONo nombre},
                      ${formatearDependenciasDeComplemento dependencias}
                      lazy = ${if lazy.activar then "true" else "false"},
                      ${formatearEventosDeComplemento lazy.eventos}
                      ${formatearComandosDeComplemento lazy.comandos}
                      ${formatearTiposDeArchivoDeComplemento lazy.tiposDeArchivo}
                      ${formatearTeclasDeComplemento lazy.teclas}
                      ${configuracionONo configuracion}
                    }'';

                complementosFormateadosALua = builtins.filter (x: x != "") (
                  map (
                    nombre:
                    let
                      complemento = cfg.complementos.${nombre};
                    in
                    if complemento.activar then formatearComplementoDeLua nombre complemento else ""
                  ) nombresDeComplementos
                );

                complementosFormateadosALazy =
                  if cfg.complementos == { } then
                    "{}"
                  else
                    /* lua */ ''
                      {${builtins.concatStringsSep "\n," complementosFormateadosALua}}
                    '';
              in
              /* lua */ ''
                require("lazy").setup({
                  spec = ${complementosFormateadosALazy},
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
