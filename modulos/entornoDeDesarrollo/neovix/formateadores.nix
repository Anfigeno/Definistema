{ pkgs, ... }:
{
  programs.neovix.formateadores = {
    "biome".paquete = pkgs.biome;
    "fish_indent".paquete = pkgs.fish;
    "autopep8".paquete = pkgs.python314Packages.autopep8;
    "gofmt".paquete = pkgs.go;
    "mdformat".paquete = pkgs.mdformat;
    "nixfmt".paquete = pkgs.nixfmt;
    "stylua".paquete = pkgs.stylua;
    "prettierd".paquete = pkgs.prettierd;
    "rufo".paquete = pkgs.rufo;
    "nufmt".paquete = pkgs.nufmt;
    "qmlformat".paquete = pkgs.kdePackages.qtdeclarative;
  };
}
