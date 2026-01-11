{
  lib,
  config,
  usuario,
  pkgs,
  ...
}:
let
  cfg = config.definistema;
in
{
  options.definistema.entornoDeDesarrollo.ssh = {
    activar = lib.mkEnableOption "Activa el módulo de ssh";
  };

  config = lib.mkIf cfg.entornoDeDesarrollo.ssh.activar {
    services.openssh = {
      enable = true;
      allowSFTP = true;
    };

    home-manager.users.${usuario}.home.packages = with pkgs; [
      sshfs
    ];
  };
}
