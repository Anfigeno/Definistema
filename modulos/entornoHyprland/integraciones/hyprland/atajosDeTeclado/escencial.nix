{ pkgs, ... }:
[
  "SUPER SHIFT, r, exec, hyprctl reload"
  "SUPER SHIFT, c, killactive"
  "SUPER SHIFT, F, togglefloating"
  "SUPER SHIFT, F, centerwindow"
  "SUPER, F, fullscreen"
  "SUPER, r, resizeactive, exact 600 400"
  "SUPER, c, centerwindow"

  # Cambiar entre ventanas
  "SUPER, h, movefocus, l"
  "SUPER, j, movefocus, d"
  "SUPER, k, movefocus, u"
  "SUPER, l, movefocus, r"

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
  "SUPER+SHIFT, h, swapwindow, l"
  "SUPER+SHIFT, l, swapwindow, r"
  "SUPER+SHIFT, k, swapwindow, u"
  "SUPER+SHIFT, j, swapwindow, d"

  # Crear/Alternar grupo con la ventana activa
  "SUPER, g, togglegroup"

  # Control de bloqueo de grupos
  "SUPER+SHIFT, g, lockactivegroup, toggle"

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
      "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
    ]
  ) 9
))
