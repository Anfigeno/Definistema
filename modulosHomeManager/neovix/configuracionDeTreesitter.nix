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
  programs.neovix.complementos."Treesitter" = {
    paquete = pkgs.vimPlugins.nvim-treesitter;
    dependencias =
      let
        todasLasGramaticas = lib.lists.flatten (
          map (
            nombre:
            let
              lenguaje = cfg.lenguajes.${nombre};
            in
            with lenguaje;
            if activar then gramaticas else [ ]
          ) (builtins.attrNames cfg.lenguajes)
        );
      in
      todasLasGramaticas;
    configuracion = /* lua */ ''
      require('nvim-treesitter.configs').setup({
        highlight = { enable = true },
        indent = { enable = true },
      })
    '';
    lazy.eventos = [
      "BufReadPost"
      "BufNewFile"
    ];
  };
}
