{
  lib,
  pkgs,
  config,
  ...
}:

let
  cfg = config.programs.neovix;

  lenguajesActivadosYConLsps =
    cfg.lenguajes
    |> lib.mapAttrsToList (
      clave: lenguaje: with lenguaje; if !activar || lsps == null then clave else null
    )
    |> builtins.filter (x: x != null)
    |> removeAttrs cfg.lenguajes;
in
{
  programs.neovix.complementos = lib.mkIf (cfg.activar && lenguajesActivadosYConLsps != { }) {
    "LSP Config" =
      let
        lspsEnUso =
          lenguajesActivadosYConLsps
          |> lib.mapAttrsToList (_: lenguaje: lenguaje.lsps)
          |> lib.lists.flatten
          |> lib.unique
          # Ahora tenemos los nombres de los LSP en uso
          |> (
            x:
            cfg.lsps
            |> lib.mapAttrsToList (
              clave: lsp:
              if !(builtins.elem clave x) then
                null
              else
                {
                  name = clave;
                  value = lsp;
                }
            )
          )
          |> builtins.filter (x: x != null)
          |> lib.listToAttrs;
      in
      {
        paquete = pkgs.vimPlugins.nvim-lspconfig;
        dependenciasDeSistema =
          lspsEnUso |> lib.mapAttrsToList (_: lsp: lsp.paquete) |> builtins.filter (x: x != null);
        configuracion = # lua
          let
            configuracionesDeLsp =
              lspsEnUso
              |> lib.mapAttrsToList (
                clave: lsp:
                if lsp.configuracion == null then
                  null
                else
                  /* lua */ ''vim.lsp.config("${clave}", ${lsp.configuracion |> lib.generators.toLua { }}) ''
              )
              |> builtins.filter (x: x != null)
              |> builtins.concatStringsSep "\n";

            activacionesDeLsp =
              lspsEnUso
              |> lib.mapAttrsToList (clave: _: /* lua */ ''vim.lsp.enable("${clave}") '')
              |> builtins.concatStringsSep "\n";

            configuracion =
              [
                configuracionesDeLsp
                activacionesDeLsp
              ]
              |> builtins.concatStringsSep "\n\n";
          in
          configuracion;
        lazy.eventos = [
          "BufReadPre"
          "BufNewFile"
        ];
      };
  };
}
