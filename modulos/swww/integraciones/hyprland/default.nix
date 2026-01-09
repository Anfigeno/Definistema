{
  usuario,
  pkgs,
  inputs,
  config,
  lib,
  ...
}:
let
  cfg = config.definistema;
  activar = cfg.swww.activar && cfg.entornoHyprland.hyprland.activar;
in
{
  config = lib.mkIf activar {
    home-manager.users.${usuario}.wayland.windowManager.hyprland.settings.exec =
      let
        fondoDePantallaAletario = import ../../fondoDePantallaAletorio.nix { inherit pkgs inputs; };
      in
      [ "${fondoDePantallaAletario}/bin/fondo-de-pantalla-aleatorio" ];
  };
}
