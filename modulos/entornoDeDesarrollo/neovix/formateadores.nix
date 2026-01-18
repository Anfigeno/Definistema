{ pkgs, ... }:
{
  programs.neovix.formateadores = {
    "nixfmt" = {
      paquete = pkgs.nixfmt;
      configuracion = {
        exe = "nixfmt";
        stdin = 1;
      };
    };
    "stylua" = {
      paquete = pkgs.stylua;
      configuracion = {
        exe = "stylua";
        args = [
          "--search-parent-directories"
          "--stdin-filepath"
          ''"%:p"''
          "--"
          "-"
        ];
        stdin = 1;
      };
    };
    "prettierd" = {
      paquete = pkgs.prettierd;
      configuracion = {
        exe = "prettierd";
        args = [ ''"%:p"'' ];
        stdin = 1;
      };
    };
    "biome" = {
      paquete = pkgs.biome;
      configuracion = {
        exe = "biome";
        try_node_exe = 1;
        args = [
          "format"
          ''--stdin-file-path="%:p"''
        ];
        no_append = 1;
        stdin = 1;
      };
    };
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
