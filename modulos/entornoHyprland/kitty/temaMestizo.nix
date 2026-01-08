# NOTA: Generado por Claude y modificado
{ inputs }:
let
  mestizo = inputs.mestizo-nix.paleta;
in
with mestizo;
{
  # Colores básicos
  background = base;
  foreground = tope;
  selection_background = base3;
  selection_foreground = tope;

  # Colores del cursor
  cursor = tope;
  cursor_text_color = base;

  # Color de subrayado de URL al pasar el mouse
  url_color = tope_2;

  # Colores de bordes de ventana de Kitty
  active_border_color = tope_2;
  inactive_border_color = tope_3;

  # Colores de barra de título del SO
  wayland_titlebar_color = base;
  macos_titlebar_color = base;

  # Colores de barra de pestañas
  active_tab_background = base;
  active_tab_foreground = tope;
  inactive_tab_background = base_1;
  inactive_tab_foreground = tope_2;
  tab_bar_background = base_1;

  # Los 16 colores del terminal
  # normales
  color0 = base_1;
  color1 = rojo;
  color2 = verde;
  color3 = amarillo;
  color4 = azul;
  color5 = magenta;
  color6 = cian;
  color7 = tope;

  # brillantes
  color8 = tope_2;
  color9 = rosa;
  color10 = verde;
  color11 = amarillo;
  color12 = azul;
  color13 = magenta;
  color14 = cian;
  color15 = tope3;

  # colores extendidos base16
  color16 = naranja;
  color17 = rosa;
  color18 = base1;
  color19 = base2;
  color20 = tope_2;
  color21 = tope1;
}
