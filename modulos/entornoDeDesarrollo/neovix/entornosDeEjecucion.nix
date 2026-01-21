{ pkgs, ... }:
{
  programs.neovix.entornosDeEjecucion = {
    "fish" = {
      paquete = pkgs.fish;
      configuracionDeCodeRunner = "fish";
    };
    "python" = {
      paquete = pkgs.python314;
      configuracionDeCodeRunner = "python -u";
    };
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
