{
  lib,
  config,
  usuario,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.definistema;
in
{
  imports = [
    ./integraciones
  ];

  options.definistema.firefox = {
    activar = lib.mkEnableOption "Activa el módulo de firefox";
  };

  config = lib.mkIf cfg.firefox.activar {
    home-manager.users.${usuario}.programs.firefox =
      let
        perfiles = import ./perfiles { inherit lib inputs pkgs; };
      in
      {
        enable = true;
        package = (pkgs.wrapFirefox (pkgs.firefox-unwrapped.override { pipewireSupport = true; }) { });
        profiles = perfiles;
        languagePacks = [
          "es-MX"
          "es-ES"
        ];
        policies.ExtensionSettings =
          (import ./perfiles/extensiones.nix { inherit pkgs lib; }).configuracionParaPolicies;
      };
  };
}
