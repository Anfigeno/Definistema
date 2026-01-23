{ pkgs, ... }:
[
  "SUPER, SPACE, exec, ${pkgs.wofi}/bin/wofi --show drun"
  "SUPER, RETURN, exec, ${pkgs.kitty}/bin/kitty --single-instance"
  "SUPER, e, exec, ${pkgs.nautilus}/bin/nautilus"
  ", Print, exec, ${pkgs.grim}/bin/grim - | ${pkgs.wl-clipboard}/bin/wl-copy"
  ''SHIFT, Print, exec, ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp -d)" - | ${pkgs.wl-clipboard}/bin/wl-copy''
]
