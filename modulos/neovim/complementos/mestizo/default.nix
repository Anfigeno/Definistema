{ deGithub, ... }: {
  paquete = deGithub {
    rev = "7b131e9e792dc2c98ab43c76463b241464fc5cdd";
    ref = "main";
    repo = "anfigeno/mestizo.nvim";
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
          name = "Mestizo",
          lazy = false,
          dependencies = dependencias,
          config = function()
            vim.cmd("colorscheme mestizo")
          end
        }
      end
    '';
}
