{
  config,
  usuario,
  lib,
  ...
}:
let
  cfg = config.definistema;
in
{
  options.definistema.entornoDeDesarrollo.gh = {
    activar = lib.mkEnableOption "Activa el módulo de gh";
  };

  config = lib.mkIf cfg.entornoDeDesarrollo.gh.activar {
    home-manager.users.${usuario}.programs.gh = {
      enable = true;
      settings = {
        editor = "nvim";
      };
    };
  };
}
