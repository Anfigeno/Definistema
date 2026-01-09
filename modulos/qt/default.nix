{
  pkgs,
  usuario,
  lib,
  config,
  ...
}:
let
  cfg = config.definistema;
in
{
  options.definistema.qt = {
    activar = lib.mkEnableOption "Activa el módulo de qt";
  };

  config = lib.mkIf cfg.qt.activar {
    home-manager.users.${usuario}.qt = {
      enable = true;
      platformTheme.name = "gtk";
      style = {
        name = "gtk2";
        package = pkgs.kdePackages.breeze-gtk;
      };
    };
  };
}
