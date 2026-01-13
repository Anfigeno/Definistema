{ deGithub, ... }:
{
  paquete = deGithub {
    rev = "d7973b157a632d1edeff01818f18d67e584eeaff";
    ref = "main";
    repo = "wakatime/vim-wakatime";
  };
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "Wakatime",
          lazy = false,
        }
      end
    '';
}
