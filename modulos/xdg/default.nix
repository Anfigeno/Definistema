{
  usuario,
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.definistema;
in
{
  options.definistema.xdg = {
    activar = lib.mkEnableOption "Activa el módulo de xdg";
  };

  config = lib.mkIf cfg.xdg.activar {
    home-manager.users.${usuario}.xdg = {
      enable = true;

      userDirs = {
        enable = true;
        createDirectories = true;

        desktop = "Escritorio";
        documents = "Documentos";
        download = "Descargas";
        music = "Música";
        pictures = "Imágenes";
        videos = "Videos";
        templates = "Plantillas";
        publicShare = "Público";
      };

      portal = {
        extraPortals = with pkgs; [
          (
            if
              cfg.entornoHyprland.hyprland.activar # #
            then
              xdg-desktop-portal-hyprland
            else
              null
          )
        ];

        config.common.default = [
          (
            if
              cfg.entornoHyprland.hyprland.activar # #
            then
              "hyrpland"
            else
              "hyprland"
          )
        ];
      };
    };
  };
}
