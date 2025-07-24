
{ config, pkgs, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      monitor = ", 1920x1080@60, 0x0, 1";

      exec-once = "waybar & hyprpaper & alacritty";

      "$terminal" = "alacritty";
      "$browser" = "firefox";
      "$fileManager" = "thunar";
      "$menu" = "wofi --show drun";
      "$screenshot" = "grim -l 0 -g \"$(slurp)\" - | wl-copy";

      env = "XCURSOR_SIZE, 24";

      input = {
        kb_layout = "de";
        follow_mouse = 1;

        touchpad = {
          natural_scroll = "no";
        };
      };

      decoration = {
        rounding = 0;
      };
      "$mod" = "SUPER";

      bind = [
        "$mod, T, exec, $terminal"
        "$mod, Q, killactive"
        "$mod, M, exit"
        "$mod, E, exec, $fileManager"
        "$mod, B, exec, $browser"
        "$mod, SPACE, exec, $menu"
        "$mod, P, pseudo"
        "$mod, J, togglesplit"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
      ];
    };
  };
}
