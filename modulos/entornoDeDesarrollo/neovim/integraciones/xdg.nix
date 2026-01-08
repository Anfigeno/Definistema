{
  xdg.desktopEntries.neovim = {
    name = "Neovim";
    genericName = "Text Editor";
    comment = "Edita archivos con Neovim";
    exec = "kitty --class Neovim -e nvim %F";
    icon = "nvim";
    terminal = false;
    type = "Application";
    categories = [
      "Utility"
      "TextEditor"
      "Development"
      "IDE"
    ];
    mimeType = [
      "text/plain"
      "text/x-makefile"
      "text/x-c++hdr"
      "text/x-c++src"
      "text/x-chdr"
      "text/x-csrc"
      "text/x-java"
      "text/x-moc"
      "text/x-pascal"
      "text/x-tcl"
      "text/x-tex"
      "application/x-shellscript"
      "text/x-c"
      "text/x-c++"
      "text/x-python"
      "text/x-lua"
      "text/x-rust"
      "text/x-go"
      "text/x-javascript"
      "text/x-typescript"
      "text/html"
      "text/css"
      "text/x-yaml"
      "text/x-json"
      "text/markdown"
      "text/x-nix"
    ];
  };
}
