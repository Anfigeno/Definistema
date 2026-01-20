{ pkgs, ... }:
{
  programs.neovix.entornosDeEjecucion = {
    "bun" = {
      paquete = pkgs.bun;
      configuracionDeCodeRunner = "bun";
    };
    "ruby" = {
      paquete = pkgs.ruby;
      configuracionDeCodeRunner = "ruby";
    };
  };
}
