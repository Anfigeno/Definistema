{ pkgs, ... }:
{
  programs.neovix.formateadores = {
    "gofmt".paquete = pkgs.go;
    "mdformat".paquete = pkgs.mdformat;
    "nixfmt".paquete = pkgs.nixfmt;
    "stylua".paquete = pkgs.stylua;
    "prettierd".paquete = pkgs.prettierd;
    "biome".paquete = pkgs.biome;
    "rufo".paquete = pkgs.rufo;
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
