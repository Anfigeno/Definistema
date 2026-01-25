{
  lib,
  pkgs,
  ...
}:
let
  perfilBase = {
    extensions = (import ./extensiones.nix { inherit pkgs lib; }).configuracionParaPerfiles;
    settings = import ./configuracion.nix;
    search = import ./busqueda { inherit lib; };
    userChrome = builtins.readFile ./userChrome.css;
  };
in
[
  "Productividad"
  "Defecto"
  "Procrastinación"
  "Investigación"
]
|> lib.imap0 (
  i: nombre: {
    name = nombre;
    value = perfilBase // {
      name = nombre;
      isDefault = if i == 0 then true else false;
      id = i;
    };
  }
)
|> lib.listToAttrs
