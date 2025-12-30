{ usuario, pkgs, lib, ... }:
let
  nombresDeComplementos = [ "fzf" "tide" "done" ];

  complementos = (map (nombreDeComplemento:
    (import ./complementos/${nombreDeComplemento}.nix { inherit pkgs; }))
    nombresDeComplementos);
in {
  home-manager.users.${usuario} = {
    home.packages = (lib.lists.flatten
      (map (complemento: complemento.dependencias) complementos));

    programs.fish = {
      enable = true;
      plugins = (map (complemento: complemento.configuracion) complementos);
    };
  };
}
