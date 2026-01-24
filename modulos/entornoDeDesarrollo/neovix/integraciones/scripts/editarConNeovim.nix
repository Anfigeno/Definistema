{ pkgs }:
pkgs.writeShellScriptBin "editar-con-neovim" # sh
  ''
    RUTA_DE_CARPETA="/tmp/Editar con Neovim"
    mkdir -p "$RUTA_DE_CARPETA"
    cd "$RUTA_DE_CARPETA"
    RUTA_DE_ARCHIVO="$RUTA_DE_CARPETA/portapapeles.md"
    ${pkgs.wl-clipboard}/bin/wl-paste -n >> "$RUTA_DE_ARCHIVO"
    ${pkgs.kitty}/bin/kitty --class "Neovim" nvim "$RUTA_DE_ARCHIVO"
    cat "$RUTA_DE_ARCHIVO" | ${pkgs.wl-clipboard}/bin/wl-copy -n
    rm -rf "$RUTA_DE_CARPETA"
    exit
  ''
