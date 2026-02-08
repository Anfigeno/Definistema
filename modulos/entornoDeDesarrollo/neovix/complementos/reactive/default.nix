{ pkgs, lib, ... }:
let
  deGithub = import ../../util/deGithub.nix { inherit pkgs lib; };
in
{
  programs.neovix.complementos."Reactive" = {
    paquete = deGithub {
      rev = "0588b5c2b0cf49bd2232fe4366b3516c32edee44";
      ref = "main";
      repo = "rasulomaroff/reactive.nvim";
    };
    configuracion = /* lua */ ''
      require("reactive").add_preset(require("mestizo256").integraciones_especiales.reactive)
    '';
    lazy.activar = false;
  };
}
