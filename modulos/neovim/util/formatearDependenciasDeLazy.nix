dependencias:
builtins.concatStringsSep ",\n " (map (dependencia: # lua
  ''{ dir = "${dependencia}" }'') dependencias)
