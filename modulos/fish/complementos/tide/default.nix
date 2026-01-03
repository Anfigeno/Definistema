{ pkgs, ... }:
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
  configuracion = # fish
    ''
      set -g tide_os_color brwhite
      set -g tide_os_bg_color red
      set -g tide_pwd_bg_color cyan
      set -g tide_pwd_color_anchors black
      set -g tide_pwd_color_dirs brblack
      set -g tide_pwd_color_truncated_dirs brblack
    '';
}
