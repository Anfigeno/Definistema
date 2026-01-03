{ deGithub, ... }: {
  paquete = deGithub {
    rev = "7b131e9e792dc2c98ab43c76463b241464fc5cdd";
    ref = "main";
    repo = "anfigeno/mestizo.nvim";
  };
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "Mestizo",
          lazy = false,
          config = function()
            vim.cmd("colorscheme mestizo")
          end
        }
      end
    '';
}
