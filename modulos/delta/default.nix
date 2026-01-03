{
  usuario,
  pkgs,
  inputs,
  ...
}:
let
  mestizo = inputs.mestizo-nix.paletaExtendida;
in
{
  home-manager.users.${usuario} = {
    programs.fish.shellInit = # sh
      ''set -Ux fzf_diff_highlighter ${pkgs.delta}/bin/delta --paging=never'';

    programs.delta = {
      enable = true;
      enableGitIntegration = true;
      options = {
        file-style = "${mestizo.tope} ${mestizo.base3}";
        file-decoration-style = "${mestizo.tope} omit";

        hunk-header-style = "file line-number syntax";
        hunk-header-decoration-style = "bold ${mestizo.base3} omit";
        hunk-header-file-style = "${mestizo.rosa}";

        line-numbers = true;
        line-numbers-zero-style = mestizo.tope_3;
        line-numbers-left-style = "${mestizo.base3}";
        line-numbers-right-style = "${mestizo.base3}";
        line-numbers-minus-style = "${mestizo.rojo} italic";
        line-numbers-plus-style = "${mestizo.verde} italic";

        plus-style = "syntax ${mestizo.verdeBase}";
        minus-style = "syntax ${mestizo.rojoBase}";
        plus-emph-style = "syntax ${mestizo.verdeBaseResaltado}";
        minus-emph-style = "syntax ${mestizo.rojoBaseResaltado}";
      };
    };
  };
}
