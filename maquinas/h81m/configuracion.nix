{ pkgs, ... }:
{
  definistema = {
    entornoDeDesarrollo.activar = true;
    paquetes = with pkgs; [
      temurin-jre-bin-17
    ];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  fileSystems."/mnt/largo-plazo-1" = {
    device = "/dev/disk/by-uuid/581046b4-2fb2-4e65-85d1-46d9d2ddbdd5";
    fsType = "ext4";
  };
  fileSystems."/mnt/largo-plazo-2" = {
    device = "/dev/disk/by-uuid/f805530c-1390-4914-8861-7f6acbb8028c";
    fsType = "ext4";
  };

  networking.firewall.enable = false;
}
