{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.statuscol-nvim;
  dependencias = [ ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias string[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "Statuscol",
          event = { "BufReadPre", "BufNewFile" },
          dependencies = dependencias,
          config = function ()
            local builtin = require("statuscol.builtin")

            require("statuscol").setup({
              thousands = true,
              segments = {
                { text = { "%s", " " }, click = "v:lua.ScSa" },
                {
                  text = { builtin.lnumfunc, " " },
                  condition = { true, builtin.not_empty },
                  click = "v:lua.ScLa",
                },
                {
                  sign = { name = { ".*" }, maxwidth = 1, colwidth = 1, auto = true },
                  click = "v:lua.ScSa",
                },
                {
                  text = { " " },
                },
              },
            })
          end
        }
      end
    '';
}
