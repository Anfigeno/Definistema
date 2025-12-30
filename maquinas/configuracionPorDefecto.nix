{ pkgs, maquina, usuario, ... }:

{
  imports =
    [ ./${maquina}/hardware.nix ./${maquina}/configuracion.nix ../modulos ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.${usuario} = ./homePorDefecto.nix;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = maquina;
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "America/Lima";

  i18n.defaultLocale = "es_PE.UTF-8";

  services.xserver.xkb = {
    layout = "latam";
    variant = "";
  };

  console.keyMap = "la-latin1";

  users.users.${usuario} = {
    isNormalUser = true;
    description = usuario;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };

  environment.systemPackages = with pkgs; [ fish neovim git ];

  system.stateVersion = "25.11";
}
