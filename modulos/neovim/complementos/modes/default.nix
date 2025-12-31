{ deGithub, ... }: {
  paquete = deGithub {
    rev = "0932ba4e0bdc3457ac89a8aeed4d56ca0b36977a";
    ref = "main";
    repo = "mvllow/modes.nvim";
  };
  dependencias = [ ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias string[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "Modes",
          event = { "BufReadPost", "BufNewFile" },
          dependencies = dependencias,
          config = function()
            require("modes").setup({
              colors = require("mestizo.claves.integraciones.especial.modes"),
            })
          end
        }
      end
    '';
}
