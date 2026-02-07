{ pkgs, ... }:
{
  programs.neovix.complementos."Mini Statusline" = {
    paquete = pkgs.vimPlugins.mini-statusline;
    dependencias = with pkgs.vimPlugins; [
      mini-icons
      mini-diff
      mini-git
    ];
    configuracion = /* lua */ ''
      local MiniStatusline = require("mini.statusline")

      MiniStatusline.setup({
        use_icons = true,
        content = {
          active = function()
            return MiniStatusline.combine_groups(
              require("mestizo256.integraciones_especiales.mini-statusline").obtener_todo_el_conjunto()
            )
          end,
        },
      })
    '';
    lazy.eventos = [ "VimEnter" ];
  };
}
