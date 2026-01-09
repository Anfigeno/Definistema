{
  shadow = {
    enabled = true;
    range = 40;
    offset = "0, 0";
    render_power = 3;
    color = "rgba(00000080)";
    color_inactive = "rgba(00000055)";
  };

  blur = {
    enabled = true;
    size = 6;
    passes = 3;
    new_optimizations = true;
    ignore_opacity = true;
  };

  bezier = [
    "easeInOutQuart, 0.76, 0, 0.24, 1"
    "easeOutQuart, 0.25, 1, 0.5, 1"
  ];

  animation = [
    "windows, 1, 5, easeInOutQuart, slide"
    "border, 1, 5, easeOutQuart"
    "fade, 1, 5, easeOutQuart"
    "workspaces, 1, 3, easeInOutQuart, slidevert"
  ];
}
