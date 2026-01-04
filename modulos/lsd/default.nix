{
  usuario,
  inputs,
  pkgs,
  ...
}:
{
  home-manager.users.${usuario} = {
    programs.lsd = {
      enable = true;
      enableFishIntegration = true;
      colors = inputs.mestizo-nix.integraciones.lsd;
    };

    programs.fish.shellInit = # fish
      ''
        set -Ux fzf_preview_dir_cmd '${pkgs.lsd}/bin/lsd --color always --icon always -1 --group-directories-first'
      '';
  };
}
