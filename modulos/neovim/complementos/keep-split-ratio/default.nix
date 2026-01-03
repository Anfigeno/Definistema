{ deGithub, ... }:
{
  paquete = deGithub {
    rev = "906aa5196e194dca12c7729069760d42e77ddcff";
    ref = "main";
    repo = "adlrwbr/keep-split-ratio.nvim";
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
          name = "Keep Split Ratio",
          lazy = false,
          dependencies = dependencias,
          opts = {},
        }
      end
    '';
}
