{
  usuario,
  inputs,
  config,
  lib,
  ...
}:

let
  cfg = config.definistema;
in
{
  imports = [
    ./integraciones
  ];

  options.definistema.entornoDeDesarrollo.delta = {
    activar = lib.mkEnableOption "Activa el módulo de delta";
  };

  config = lib.mkIf cfg.entornoDeDesarrollo.delta.activar {
    home-manager.users.${usuario}.programs.delta = {
      enable = true;
      enableGitIntegration = true;
      options =
        let
          mestizo = inputs.mestizo-nix.paletaExtendida;
        in
        {
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
