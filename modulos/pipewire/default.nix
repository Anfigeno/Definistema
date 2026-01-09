{ lib, config, ... }:
let
  cfg = config.definistema;
in
{
  options.definistema.pipewire = {
    activar = lib.mkEnableOption "Activa el módulo de pipewire";
  };

  config = lib.mkIf cfg.pipewire.activar {
    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
