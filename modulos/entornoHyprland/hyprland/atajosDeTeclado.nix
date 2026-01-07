{ pkgs }:
[
  "SUPER, SPACE, exec, ${pkgs.wofi}/bin/wofi --show drun"
  "SUPER, RETURN, exec, ${pkgs.kitty}/bin/kitty"
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
