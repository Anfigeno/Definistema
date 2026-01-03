{ usuario, ... }:
{
  home-manager.users.${usuario}.programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
