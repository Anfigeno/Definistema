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
        conComplementos = clave: respaldo: map (c: c.${clave} or respaldo) complementos;
      in
      {
        home.packages = lib.lists.flatten (conComplementos "dependencias" [ ]);

        programs.fish = {
          enable = true;
          plugins = conComplementos "paquete" "";
          shellInit =
            let
              configuracionDeComplementos = builtins.concatStringsSep "\n" (conComplementos "configuracion" "");
              mestizoFish = inputs.mestizo-nix.integraciones.fish;
            in
            configuracionDeComplementos + mestizoFish;
        };
      };
  };
}
