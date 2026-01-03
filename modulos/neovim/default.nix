{
  usuario,
  pkgs,
  lib,
  ...
}:
{
  home-manager.users.${usuario}.programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraLuaConfig = import ./init.lua.nix { inherit pkgs; };
    plugins = [ (import ./lazy.nix { inherit pkgs lib; }) ];
  };
}
