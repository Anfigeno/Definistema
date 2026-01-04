{ pkgs, inputs, ... }:
{
  dependencias = with pkgs; [
    fd
    fzf
    bat
  ];
  paquete = {
    name = "fzf-fish";
    src = pkgs.fetchFromGitHub {
      owner = "PatrickF1";
      repo = "fzf.fish";
      rev = "8920367cf85eee5218cc25a11e209d46e2591e7a";
      sha256 = "T8KYLA/r/gOKvAivKRoeqIwE2pINlxFQtZJHpOy9GMM=";
    };
  };
  configuracion =
    let
      mestizo-nix = inputs.mestizo-nix;
    in
    # fish
    ''
      set -Ux FZF_DEFAULT_OPTS '${mestizo-nix.integraciones.fzf} --preview-window=65%'
    '';
}
