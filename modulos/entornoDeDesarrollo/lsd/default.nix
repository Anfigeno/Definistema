{
  usuario,
  inputs,
  lib,
  config,
  ...
}:
let
  cfg = config.definistema;
in
{
  imports = [
    ./integraciones
  ];

  options.definistema.entornoDeDesarrollo.lsd = {
    activar = lib.mkEnableOption "Activa el módulo de lsd";
  };

  config = lib.mkIf cfg.entornoDeDesarrollo.lsd.activar {
    home-manager.users.${usuario}.programs.lsd = {
      enable = true;
      enableFishIntegration = true;
      colors = inputs.mestizo-nix.integraciones.lsd;
    };
  };
}
