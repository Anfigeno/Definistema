{ deGithub, ... }:
{
  paquete = deGithub {
    rev = "906aa5196e194dca12c7729069760d42e77ddcff";
    ref = "main";
    repo = "adlrwbr/keep-split-ratio.nvim";
  };
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "Keep Split Ratio",
          event = "BufEnter",
          opts = {},
        }
      end
    '';
}
