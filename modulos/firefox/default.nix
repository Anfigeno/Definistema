{
  lib,
  config,
  usuario,
  pkgs,
  perfiles,
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
    home-manager.users.${usuario}.programs.firefox = {
      enable = true;
      package = (pkgs.wrapFirefox (pkgs.firefox-unwrapped.override { pipewireSupport = true; }) { });
      profiles = import ./perfiles { inherit lib pkgs perfiles; };
      languagePacks = [
        "es-MX"
        "es-ES"
      ];
      policies.ExtensionSettings =
        (import ./perfiles/extensiones.nix { inherit pkgs lib; }).configuracionParaPolicies;
    };
  };
}
