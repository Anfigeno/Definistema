{
  usuario,
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.definistema;
in
{
  config = lib.mkIf cfg.entornoHyprland.activar {
    home-manager.users.${usuario} =
      let
        fondoDePantallaAletario = import ./fondoDePantallaAletorio.nix { inherit pkgs inputs; };
      in
      {
        services.swww.enable = true;

        wayland.windowManager.hyprland.settings.exec = [
          "${fondoDePantallaAletario}/bin/fondo-de-pantalla-aleatorio"
        ];
      };
  };
}
