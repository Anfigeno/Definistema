{ deGithub, ... }: {
  paquete = deGithub {
    rev = "c62ea30a4cab39b8eb34973f297feb35bbac664c";
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
