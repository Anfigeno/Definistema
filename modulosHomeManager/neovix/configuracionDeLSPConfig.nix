{
  lib,
  pkgs,
  config,
  ...
}:

let
  cfg = config.programs.neovix;

  inherit (import ./util.nix { inherit lib; })
    mapSin
    aLua
    map
    aplanar
    concatenar
    ;
  lenguajesActivados = mapSin null (builtins.attrNames cfg.lenguajes) (
    nombre:
    let
      lenguaje = cfg.lenguajes.${nombre};
    in
    with lenguaje;
    if !activar then null else lenguaje
  );

  lspActivos = aplanar (
    map lenguajesActivados (
      lenguaje:
      mapSin null (builtins.attrNames lenguaje.lsp) (
        nombre:
        let
          lsp = lenguaje.lsp.${nombre};
        in
        with lsp;
        if !activar then
          null
        else
          {
            clave = nombre;
            valor = lsp;
          }
      )
    )
  );
in
{
  programs.neovix.complementos = lib.mkIf (cfg.activar && lspActivos != [ ]) {
    "LSP Config" = {
      paquete = pkgs.vimPlugins.nvim-lspconfig;
      dependenciasDeSistema =
        let
          paquetesDeLsp = mapSin null lspActivos (lsp: lsp.valor.paquete);
        in
        lib.mkIf (paquetesDeLsp != [ ]) paquetesDeLsp;
      configuracion = # lua
        let
          configuracionesDeLsp = mapSin null lspActivos (
            lsp:
            with lsp;
            if valor.configuracion == null then
              null
            else
              /* lua */ ''vim.lsp.config("${clave}", ${aLua valor.configuracion})''
          );

          activacionesDeLsp = map lspActivos (lsp: /* lua */ ''vim.lsp.enable("${lsp.clave}")'');

          configuracion = concatenar "\n\n" [
            (concatenar "\n" configuracionesDeLsp)
            (concatenar "\n" activacionesDeLsp)
          ];
        in
        configuracion;
      lazy.eventos = [
        "BufReadPre"
        "BufNewFile"
      ];
    };
  };
}
