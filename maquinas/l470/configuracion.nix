{
  pkgs,
  pkgs-unstable,
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
    bluetooth.activar = true;
    udiskie.activar = true;

    paquetes = with pkgs; [
      prismlauncher
      pkgs-unstable.stoat-desktop
    ];
  };

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.networkmanager.settings = {
    "connection-wifi" = {
      "match-device" = "type:wifi";
      "ipv4.route-metric" = 50;
      "ipv6.route-metric" = 50;
    };
    "connection-ethernet" = {
      "match-device" = "type:ethernet";
      "ipv4.route-metric" = 100;
      "ipv6.route-metric" = 100;
    };
  };

  networking.firewall.enable = false;
}
