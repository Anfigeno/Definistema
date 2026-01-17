{
  construirTablaDeLua = componentes: /* lua */ ''
    {
      ${builtins.concatStringsSep ",\n" (builtins.filter (x: x != "") componentes)}
    }
  '';
}
