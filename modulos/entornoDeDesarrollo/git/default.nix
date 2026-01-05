{
  usuario,
  config,
  lib,
  ...
}:
let
  cfg = config.entornoDeDesarrollo;
  activar = cfg.activar || cfg.git.activar;
in
{
  options.entornoDeDesarrollo.git = {
    activar = lib.mkEnableOption "Activa el módulo de git";
  };

  config = lib.mkIf activar {
    home-manager.users.${usuario}.programs.git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        user.name = "anfigeno";
        user.email = "dolorcriticodevastador@proton.me";
      };
    };
  };
}
