{ pkgs, ... }:
{
  programs.neovix.complementos."Navic" = {
    paquete = pkgs.vimPlugins.nvim-navic;
    configuracion = /* lua */ ''
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
    '';
    lazy.eventos = [ "LspAttach" ];
  };
}
