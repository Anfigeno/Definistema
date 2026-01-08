{ usuario, pkgs, ... }:
{
  home-manager.users.${usuario} = {
    home.packages = with pkgs; [
      nautilus
      feh
      mpv
      amberol
    ];
  };
}
