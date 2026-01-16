{
  usuario,
  pkgs,
  ...
}:
{
  home-manager.users.${usuario} =
    { ... }:
    {
      imports = [ ./complementos ];

      programs.neovix = {
        activar = true;
        editorPorDefecto = true;
        configuracion = import ./configuracion.nix { inherit pkgs; };
      };
    };
}
