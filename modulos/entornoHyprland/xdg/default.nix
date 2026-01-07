{
  usuario,
  pkgs,
  ...
}:
{
  nombre = "xdg";
  configuracion = {
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
        enable = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-hyprland
          xdg-desktop-portal-gtk
        ];
        config.common.default = [ "hyrpland" ];
      };
    };
  };
}
