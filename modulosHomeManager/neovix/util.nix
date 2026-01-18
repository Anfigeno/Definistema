{ lib }:
{
  construirTablaDeLua = componentes: /* lua */ ''
    {
      ${builtins.concatStringsSep ",\n" (builtins.filter (x: x != "") componentes)}
    }
  '';
  aLua = set: lib.generators.toLua { } set;
  mapSin =
    aQuitar: lista: lambda:
    builtins.filter (x: x != aQuitar) (map lambda lista);
}
