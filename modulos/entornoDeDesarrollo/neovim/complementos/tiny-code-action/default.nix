{ pkgs, deGithub, ... }:
{
  paquete = deGithub {
    rev = "897de9af9e3aa6e59bcb9fec760a7eb02d00e264";
    ref = "main";
    repo = "rachartier/tiny-code-action.nvim";
    nvimSkipModules = [
      "tiny-code-action.backend.difftastic"
      "tiny-code-action.backend.diffsofancy"
      "tiny-code-action.backend.delta"
      "tiny-code-action.previewers.snacks"
    ];
  };
  dependencias = with pkgs.vimPlugins; [
    plenary-nvim
    telescope-nvim
  ];
  dependenciasDeSistema = [ pkgs.delta ];
  config = # lua
    ''
      ---@param paquete string
      ---@param dependencias { dir: string }[]
      ---@diagnostic disable-next-line: miss-name
      function(paquete, dependencias)
        return {
          dir = paquete,
          name = "Tiny Code Action",
          event = "LspAttach",
          dependencies = dependencias,
          opts = {
            backend = "delta"
          },
          keys = {
            {
              "gra",
              function ()
                require("tiny-code-action").code_action()
              end,
              desc = "LSP: Acción de código"
            }
          }
        }
      end
    '';
}
