{
  usuario,
  lib,
  config,
  ...
}:
let
  cfg = config.definistema;
in
{
  options.definistema.entornoDeDesarrollo.git = {
    activar = lib.mkEnableOption "Activa el módulo de git";
  };

  config = lib.mkIf cfg.entornoDeDesarrollo.git.activar {
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
