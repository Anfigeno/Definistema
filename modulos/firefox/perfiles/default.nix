{
  lib,
  pkgs,
  ...
}:
let
  perfilBase = {
    extensions = (import ./extensiones.nix { inherit pkgs lib; }).configuracionParaPerfiles;
    settings = import ./configuracion.nix;
    search = import ./busqueda;
    userChrome = builtins.readFile ./userChrome.css;
  };
in
[
  {
    name = "Productividad";
    id = 0;
    isDefault = true;
  }
  {
    name = "Defecto";
    id = 1;
  }
  {
    name = "Procrastinación";
    id = 2;
  }
  {
    name = "Investigación";
    id = 3;
  }
]
|> map (perfil: {
  name = perfil.name;
  value = perfil // perfilBase;
})
|> lib.listToAttrs
