{ usuario, pkgs, ... }:
{
  home-manager.users.${usuario} = {
    programs.discord.enable = true;
  };

  programs.steam.enable = true;

  definistema.entornoDeDesarrollo.activar = true;
  definistema.entornoHyprland.activar = true;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  services.openssh.enable = true;
}
