{ pkgs, ... }:
{
  programs.neovix.formateadores = {
    "nufmt" = {
      paquete = pkgs.nufmt;
      configuracion = {
        exe = "nufmt";
        args = [ ''"%:p"'' ];
        stdin = 1;
      };
    };
    "fish_indent".paquete = pkgs.fish;
    "autopep8".paquete = pkgs.python314Packages.autopep8;
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
