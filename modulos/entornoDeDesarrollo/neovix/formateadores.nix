{ pkgs, ... }:
{
  programs.neovix.formateadores = {
    "nixfmt".paquete = pkgs.nixfmt;
    "stylua".paquete = pkgs.stylua;
    "prettierd".paquete = pkgs.prettierd;
    "biome".paquete = pkgs.biome;
    "qmlformat" = {
      paquete = pkgs.kdePackages.qtdeclarative;
      configuracion = {
        exe = "qmlformat";
        args = [ ''"%:p"'' ];
        stdin = 1;
      };
    };
  };
}
