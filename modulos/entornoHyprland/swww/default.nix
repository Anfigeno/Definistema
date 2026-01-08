{
  usuario,
  pkgs,
  inputs,
  ...
}:
let
  fondoDePantallaAletario = import ./fondoDePantallaAletorio.nix { inherit pkgs inputs; };
in
{
  home-manager.users.${usuario} = {
    services.swww.enable = true;

    wayland.windowManager.hyprland.settings.exec = [
      "${fondoDePantallaAletario}/bin/fondo-de-pantalla-aleatorio"
    ];
  };
}
