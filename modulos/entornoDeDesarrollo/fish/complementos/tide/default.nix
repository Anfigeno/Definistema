{ pkgs, inputs, ... }:
{
  paquete = {
    name = "tide";
    src = pkgs.fetchFromGitHub {
      owner = "IlanCosman";
      repo = "tide";
      rev = "fcda500d2c2996e25456fb46cd1a5532b3157b16";
      sha256 = "sha256-dzYEYC1bYP0rWpmz0fmBFwskxWYuKBMTssMELXXz5H0=";
    };
  };
  configuracion =
    let
      f = cadena: builtins.substring 1 (-1) cadena;
    in
    with inputs.mestizo-nix.paleta; # fish
    ''
      set -g tide_os_color ${f tope2}
      set -g tide_os_bg_color ${f rojo}
      set -g tide_pwd_bg_color ${f cian} 
      set -g tide_pwd_color_anchors ${f base}
      set -g tide_pwd_color_dirs ${f base1}
      set -g tide_pwd_color_truncated_dirs ${f base2}
      set -g tide_prompt_color_frame_and_connection ${f base3}
    '';
}
