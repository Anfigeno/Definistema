{
  usuario,
  pkgs,
  inputs,
  ...
}:
let
  temaMestizoBat = {
    src = pkgs.fetchFromGitHub {
      owner = "Anfigeno";
      repo = "MestizoBat";
      rev = "883b18567d9178cd9c88c517254fc5612d22ca67";
      sha256 = "sha256-SDec/Od+cBwvirfose7P41Br0lif9SYN8yj+1eMtReo=";
    };
    file = "mestizo.tmTheme";
  };
in
{
  home-manager.users.${usuario} = {
    programs.bat = {
      enable = true;
      themes.mestizo = temaMestizoBat;
    };

    programs.fish.shellInit = # fish
      ''
        set -Ux BAT_THEME "mestizo"
      '';
  };
}
