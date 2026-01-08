{
  usuario,
  pkgs,
  lib,
  ...
}:

{

  home-manager.users.${usuario} =
    { ... }:
    {
      imports = [
        ./integraciones/xdg.nix
        ./integraciones/hyprland.nix
      ];

      programs.neovim =
        let
          complementos = import ./complementos { inherit pkgs lib; };

          dependenciasDeSistemaDeComplementos = lib.lists.flatten (
            map (complemento: complemento.dependenciasDeSistema or [ ]) complementos
          );
        in
        {
          enable = true;
          defaultEditor = true;
          extraLuaConfig = import ./init.lua.nix { inherit pkgs; };
          extraPackages = dependenciasDeSistemaDeComplementos;
          plugins = [ (import ./lazy.nix { inherit pkgs complementos; }) ];
        };
    };
}
