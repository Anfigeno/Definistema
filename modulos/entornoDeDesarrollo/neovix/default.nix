{
  usuario,
  pkgs,
  ...
}:
{
  home-manager.users.${usuario} =
    { ... }:
    {
      imports = [
        ./complementos
        ./lenguajes.nix
        ./formateadores.nix
        ./lsps.nix
      ];

      programs.neovix = {
        activar = true;
        editorPorDefecto = true;
        configuracion = import ./configuracion.nix { inherit pkgs; };
      };
    };
}
