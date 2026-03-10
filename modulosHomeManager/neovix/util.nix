{ lib }:
{
  construirTablaDeLua = componentes: /* lua */ ''
    {
      ${builtins.concatStringsSep ",\n" (builtins.filter (x: x != "") componentes)}
    }
  '';
  aLua = set: lib.generators.toLua { } set;
  map = lista: lambda: map lambda lista;
  mapSin =
    aQuitar: lista: lambda:
    builtins.filter (x: x != aQuitar) (map lambda lista);
  aplanar = lista: lib.lists.flatten lista;
  concatenar = cadena: lista: builtins.concatStringsSep cadena lista;
  # NOTA: Generado por Claude y modificado
  fusionProfundaDeAttrs =
    let
      fusionProfunda =
        a: b:
        if lib.isAttrs a && lib.isAttrs b then
          lib.zipAttrsWith
            (
              _: vals:
              if builtins.length vals == 1 then
                builtins.head vals
              else
                fusionProfunda (builtins.elemAt vals 0) (builtins.elemAt vals 1)
            )
            [
              a
              b
            ]
        else if lib.isList a && lib.isList b then
          a ++ b
        else
          b;
    in
    lib.types.mkOptionType {
      name = "fusionProfundaDeAttrs";
      description = "attrset con fusión profunda (listas se concatenan)";
      check = lib.isAttrs;
      merge = _loc: defs: lib.foldl' fusionProfunda { } (map (d: d.value) defs);
    };
}
