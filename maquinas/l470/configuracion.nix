{
  pkgs,
  ...
}:
{
  definistema = {
    entornoDeDesarrollo.activar = true;
    entornoHyprland.activar = true;

    firefox.activar = true;
    kitty.activar = true;
    discord.activar = true;
    steam.activar = true;
    obs.activar = true;
    mestizo256nix.activar = true;

    paquetes = with pkgs; [
      prismlauncher
      stoat-desktop
    ];
  };

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
}
