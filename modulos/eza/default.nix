{ usuario, ... }: {
  home-manager.users.${usuario}.programs.eza = {
    enable = true;
    enableFishIntegration = true;
    git = true;
    icons = "always";
    colors = "always";
  };
}
