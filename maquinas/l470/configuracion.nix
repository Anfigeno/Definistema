{ ... }:
{
  entornoDeDesarrollo.activar = true;
  entornoHyprland.hyprland.activar = true;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  services.openssh.enable = true;
}
