{ usuario, ... }: {
  home-manager.users.${usuario}.programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user.name = "anfigeno";
      user.email = "dolorcriticodevastador@proton.me";
    };
  };
}
