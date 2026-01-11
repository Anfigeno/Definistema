{ ... }:
{
  definistema = {
    entornoDeDesarrollo.activar = true;
    entornoHyprland.activar = true;

    firefox.activar = true;
    kitty.activar = true;
    virtualbox.activar = true;
    discord.activar = true;
    steam.activar = true;
  };

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
}
