{ pkgs, ... }: {
  paquete = pkgs.vimPlugins.nvim-navic;
  config = # lua
    ''
      ---@param paquete string
      ---@diagnostic disable-next-line: miss-name
      function(paquete)
        return {
          dir = paquete,
          name = "Navic",
          event = "BufEnter",
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
      end
    '';
}
