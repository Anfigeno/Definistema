{ deGithub, ... }:
let
  mestizo-nvim = deGithub {
    rev = "7b131e9e792dc2c98ab43c76463b241464fc5cdd";
    ref = "main";
    repo = "anfigeno/mestizo.nvim";
  };
  # lua
in ''
  return {
    dir = "${mestizo-nvim}",
    name = "Mestizo",
    lazy = false,
    config = function()
      vim.cmd("colorscheme mestizo")
    end
  }
''
