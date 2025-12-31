{ pkgs, formatearDependenciasDeLazy, ... }:
let
  dependencias = [ ];
  # lua
in ''
  return {
    dir = "${pkgs.vimPlugins.nvim-navic}",
    name = "Navic",
    dependencies = { ${formatearDependenciasDeLazy dependencias} },
    config = function()
      require("nvim-navic").setup({
        icons = {
          File = "󰈙 ",
          Module = "󰆧 ",
          Namespace = "󰅩 ",
          Package = "󰏖 ",
          Class = "󰠱 ",
          Method = "󰆧 ",
          Property = "󰜢 ",
          Field = "󰜢 ",
          Constructor = "󰆧 ",
          Enum = "󰕘 ",
          Interface = "󰕘 ",
          Function = "󰊕 ",
          Variable = "󰀫 ",
          Constant = "󰏿 ",
          String = "󰀬 ",
          Number = "󰎠 ",
          Boolean = "󰔨 ",
          Array = "󰅪 ",
          Object = "󰅩 ",
          Key = "󰌋 ",
          Null = "NULL",
          EnumMember = "󰕘 ",
          Struct = "󰌗 ",
          Event = "",
          Operator = "󰆕",
        },
        highlight = true,
      })
    end
  }
''
