{
  usuario,
  ...
}:
{
  home-manager.users.${usuario} = {
    services.cliphist = {
      enable = true;
      allowImages = true;
    };
  };
}
