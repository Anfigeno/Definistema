{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."LSP File Operations" = {
    paquete = pkgs.vimPlugins.nvim-lsp-file-operations;
    dependencias = with pkgs.vimPlugins; [ plenary-nvim ];
    opts = { };
    configuracion = /* lua */ ''require("lsp-file-operations").setup(opts)'';
    lazy.eventos = [ "LspAttach" ];
  };
}
