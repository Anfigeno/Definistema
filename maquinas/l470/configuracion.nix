{ ... }:
{
  entornoDeDesarrollo.activar = true;
  entornoHyprland = {
    hyprland.activar = true;
    firefox.activar = true;
    gtk.activar = true;
    qt.activar = true;
    kitty.activar = true;
    fuentes.activar = true;
    xdg.activar = true;
  };

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  services.openssh.enable = true;
}
