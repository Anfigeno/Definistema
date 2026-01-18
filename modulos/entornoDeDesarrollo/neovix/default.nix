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
        ./lenguajes
      ];

      programs.neovix = {
        activar = true;
        editorPorDefecto = true;
        configuracion = import ./configuracion.nix { inherit pkgs; };
      };
    };
}
