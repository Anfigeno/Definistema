{ pkgs, ... }:
[
  "SUPER SHIFT, r, exec, hyprctl reload"
  "SUPER SHIFT, c, hy3:killactive"
  "SUPER SHIFT, F, togglefloating"
  "SUPER SHIFT, F, centerwindow"
  "SUPER, F, fullscreen"
  "SUPER, r, resizeactive, exact 600 400"
  "SUPER, c, centerwindow"

  # Cambiar entre ventanas
  "SUPER, h, hy3:movefocus, l, visible"
  "SUPER, j, hy3:movefocus, d, visible"
  "SUPER, k, hy3:movefocus, u, visible"
  "SUPER, l, hy3:movefocus, r, visible"
  "SUPER, Tab, hy3:movefocus, r"
  "SUPER SHIFT, Tab, hy3:movefocus, l"

  # Volumen
  ", XF86AudioRaiseVolume, exec, ${pkgs.pamixer}/bin/pamixer --increase 5"
  ", XF86AudioLowerVolume, exec, ${pkgs.pamixer}/bin/pamixer --decrease 5"
  ", XF86AudioMute, exec, ${pkgs.pamixer}/bin/pamixer --toggle-mute"

  # Multimedia
  ", XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
  ", XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next"
  ", XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous"
  ", XF86AudioStop, exec, ${pkgs.playerctl}/bin/playerctl stop"

  # Brillo
  ", XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl set +10%"
  ", XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 10%-"

  # Ajustar el tamaño de las ventanas
  "SUPER+ALT, h, resizeactive, -20 0"
  "SUPER+ALT, l, resizeactive, 20 0"
  "SUPER+ALT, k, resizeactive, 0 -20"
  "SUPER+ALT, j, resizeactive, 0 20"

  # Mover ventanas flotantes
  "SUPER+SHIFT, h, moveactive, -40 0"
  "SUPER+SHIFT, l, moveactive, 40 0"
  "SUPER+SHIFT, k, moveactive, 0 -40"
  "SUPER+SHIFT, j, moveactive, 0 40"

  # Intercambiar ventanas de lugar
  "SUPER+SHIFT, h, hy3:movewindow, l"
  "SUPER+SHIFT, l, hy3:movewindow, r"
  "SUPER+SHIFT, k, hy3:movewindow, u"
  "SUPER+SHIFT, j, hy3:movewindow, d"

  "SUPER, s, hy3:makegroup, h"
  "SUPER, v, hy3:makegroup, v"
  "SUPER, g, hy3:makegroup, tab, toggle"
  "SUPER+SHIFT, g, hy3:locktab"

  # Navegación entre ventanas del grupo
  "SUPER, Tab, changegroupactive, f"
  "SUPER+SHIFT, Tab, changegroupactive, b"
]
++ (builtins.concatLists (
  builtins.genList (
    i:
    let
      ws = i + 1;
    in
    [
      "$mod, code:1${toString i}, workspace, ${toString ws}"
      "$mod SHIFT, code:1${toString i}, hy3:movetoworkspace, ${toString ws}"
    ]
  ) 9
))
