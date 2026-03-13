{
  pkgs,
  usuario,
  lib,
  ...
}:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Cord" = {
    paquete = pkgs.vimPlugins.cord-nvim;
    opts = {
      text = {
        default = null;
        workspace = lib.mkLuaInline /* lua */ "function(opts) return 'En ' .. opts.workspace end";
        viewing = lib.mkLuaInline /* lua */ "function(opts) return 'Viendo ' .. opts.filename end";
        editing = lib.mkLuaInline /* lua */ "function(opts) return 'Editando ' .. opts.filename end";
        file_browser = lib.mkLuaInline /* lua */ "function(opts) return 'Navegando en ' .. opts.name end";
        plugin_manager =
          lib.mkLuaInline
            /* lua */ "function(opts) return 'Administrando complementos en ' .. opts.name end";
        lsp = lib.mkLuaInline /* lua */ "function(opts) return 'Configurando LSP en ' .. opts.name end";
        docs = lib.mkLuaInline /* lua */ "function(opts) return 'Leyendo ' .. opts.name end";
        vcs = lib.mkLuaInline /* lua */ "function(opts) return 'Comprometiendo cambios en ' .. opts.name end";
        notes = lib.mkLuaInline /* lua */ "function(opts) return 'Tomando notas en ' .. opts.name end";
        debug = lib.mkLuaInline /* lua */ "function(opts) return 'Buscando bugs en ' .. opts.name end";
        test = lib.mkLuaInline /* lua */ "function(opts) return 'Probando cosas en ' .. opts.name end";
        diagnostics = lib.mkLuaInline /* lua */ "function(opts) return 'Arreglando problemas en ' .. opts.name end";
        games = lib.mkLuaInline /* lua */ "function(opts) return 'Jugando ' .. opts.name end";
        terminal = lib.mkLuaInline /* lua */ "function(opts) return 'Ejecutando comandos en ' .. opts.name end";
        dashboard = "Inicio";
      };
    };
    configuracion = /* lua */ ''require("cord").setup(opts)'';
    lazy.eventos = [ "VeryLazy" ];
  };
}
