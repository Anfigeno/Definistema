{ usuario, ... }:
{
  home-manager.users.${usuario} = {
    programs.discord.enable = true;
  };

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ usuario ];

  programs.steam.enable = true;

  definistema = {
    entornoDeDesarrollo.activar = true;
    entornoHyprland.activar = true;

    firefox.activar = true;
    kitty.activar = true;
  };

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  services.openssh.enable = true;
}
