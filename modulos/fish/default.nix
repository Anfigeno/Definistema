{
  usuario,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  complementos = import ./complementos { inherit pkgs inputs; };
in
{
  home-manager.users.${usuario} = {
    home.packages = lib.lists.flatten (map (complemento: complemento.dependencias or [ ]) complementos);

    programs.fish = {
      enable = true;
      plugins = map (complemento: complemento.paquete) complementos;
      shellInit = builtins.concatStringsSep "\n" (
        map (complemento: complemento.configuracion or "") complementos
      );
    };
  };
}
