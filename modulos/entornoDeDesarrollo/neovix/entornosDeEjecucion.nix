{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.entornosDeEjecucion = {
    "lua" = {
      paquete = pkgs.lua;
      configuracionDeCodeRunner = "lua";
    };
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
