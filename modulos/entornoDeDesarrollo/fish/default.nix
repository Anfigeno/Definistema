{
  usuario,
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
let
  cfg = config.definistema;
in
{
  options.definistema.entornoDeDesarrollo.fish = {
    activar = lib.mkEnableOption "Activa el módulo de fish";
  };

  config = lib.mkIf cfg.entornoDeDesarrollo.fish.activar {
    home-manager.users.${usuario} =
      let
        complementos = import ./complementos { inherit pkgs inputs; };
      in
      {
        home.packages = lib.lists.flatten (map (complemento: complemento.dependencias or [ ]) complementos);

        programs.fish = {
          enable = true;
          plugins = map (complemento: complemento.paquete) complementos;
          shellInit =
            let
              configuracionDeComplementos = builtins.concatStringsSep "\n" (
                map (complemento: complemento.configuracion or "") complementos
              );
              mestizoFish = inputs.mestizo-nix.integraciones.fish;
            in
            configuracionDeComplementos + mestizoFish;
        };
      };
  };
}
