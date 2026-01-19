{
  inputs,
  pkgs,
  maquina,
  usuario,
  ...
}:

{
  imports = [
    ./${maquina}/hardware.nix
    ./${maquina}/configuracion.nix
    ../modulos
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${usuario} = ./homePorDefecto.nix;
    backupFileExtension = "respaldo-hm";
    sharedModules = [
      ../modulosHomeManager/neovix
    ];
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = maquina;
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
    "pipe-operators"
  ];

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
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  environment.systemPackages = with pkgs; [
    fish
    neovim
    git
  ];

  system.stateVersion = "25.11";
}
