{ deGithub, ... }: {
  paquete = deGithub {
    rev = "0932ba4e0bdc3457ac89a8aeed4d56ca0b36977a";
    ref = "main";
    repo = "mvllow/modes.nvim";
  };
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "Modes",
          event = { "BufReadPost", "BufNewFile" },
          config = function()
            require("modes").setup({
              colors = require("mestizo.claves.integraciones.especial.modes"),
            })
          end
        }
      end
    '';
}
