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
}
