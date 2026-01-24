{
  usuario,
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.definistema.entornoDeDesarrollo.neovix;
in
{
  imports = [ ./integraciones ];

  options.definistema.entornoDeDesarrollo.neovix = {
    activar = lib.mkEnableOption "Activa el módulo de neovix";
  };

  config = lib.mkIf cfg.activar {

    home-manager.users.${usuario} =
      { ... }:
      {
        imports = [
          ./complementos
          ./lenguajes.nix
          ./formateadores.nix
          ./lsps.nix
          ./entornosDeEjecucion.nix
        ];

        programs.neovix = {
          activar = true;
          editorPorDefecto = true;
          configuracion = import ./configuracion.nix { inherit pkgs; };
        };
      };
  };
}
