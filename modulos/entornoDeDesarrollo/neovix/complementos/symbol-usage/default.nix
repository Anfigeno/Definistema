{
  pkgs,
  usuario,
  lib,
  ...
}:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Symbol Usage" = {
    paquete = pkgs.vimPlugins.symbol-usage-nvim;
    opts = {
      text_format = lib.generators.mkLuaInline /* lua */ ''
        function(symbol)
          local fragments = {}

          local stacked_functions = symbol.stacked_count > 0
              and (' | +%s'):format(symbol.stacked_count)
              or ""

          if symbol.references then
            local usage = symbol.references <= 1 and 'uso' or 'usos'
            local num = symbol.references == 0 and 'sin' or symbol.references
            table.insert(fragments, ('%s %s'):format(num, usage))
          end

          if symbol.definition then
            table.insert(fragments, symbol.definition .. ' definiciones')
          end

          if symbol.implementation then
            table.insert(fragments, symbol.implementation .. ' implementaciones')
          end

          return table.concat(fragments, ', ') .. stacked_functions
        end
      '';
      kinds = lib.generators.mkLuaInline /* lua */ ''
        (function()
          local tipos = vim.lsp.protocol.SymbolKind
          return { tipos.Function, tipos.Method, tipos.Class, tipos.Namespace }
        end)()'';
      vt_position = "end_of_line";
      request_pending_text = "Un momento...";
      references.enabled = true;
      definition.enabled = true;
      implementation.enabled = true;
    };
    configuracion = /* lua */ ''require("symbol-usage").setup(opts)'';
    lazy.eventos = [
      "LspAttach"
    ];
  };
}
