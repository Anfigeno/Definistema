complementos:
let
  formatearDependenciasDeLazy = import ./formatearDependenciasDeLazy.nix;
in
# lua
''
  {${
    builtins.concatStringsSep ",\n " (
      map (
        complemento:
        #lua
        ''
          (
            ${complemento.config}
          )("${complemento.paquete}"${
            if complemento ? dependencias then
              # lua
              ", ${formatearDependenciasDeLazy complemento.dependencias}"
            else
              ""
          })
        '') complementos
    )
  }}
''
