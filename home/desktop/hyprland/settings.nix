{ pkgs, ... }:

{
  imports = [
    ./env.nix
    ./binds.nix
    ./window-rules.nix
    ./animations.nix
  ];

  wayland.windowManager.hyprland.settings = {
    "$terminal" = "alacritty";
    "$fileManager" = "dolphin";
    "$menu" = "fuzzel";
    "$mainMod" = "SUPER";

    exec-once = [
      "waybar"
      "hyprctl setcursor Bibata-Modern-Classic 24"
      "hyprpaper"
    ];

    monitor = [
      ",preferred,auto,1"
    ];

    general = {
      "$mainMod" = "SUPER";
      layout = "master";
      gaps_in = 2;
      gaps_out = 10;
      border_size = 2;
      resize_on_border = true;
      "col.active_border" = "$rosewater";
      "col.inactive_border" = "$surface0";
    };

    decoration = {
      rounding = 10;
      rounding_power = 2;

      active_opacity = 1.0;
      inactive_opacity = 0.99;

      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
        color = "$surface0";
      };

      blur = {
        enabled = true;
        size = 3;
        passes = 1;
        vibrancy = 0.1696;
      };
    };

    dwindle = {
      pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = true; # You probably want this
    };

    master = {
      new_status = "slave";
    };

    misc = {
      force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
      disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
    };

    input = {
      kb_layout = "us";
      kb_options = ctrl:nocaps;

      follow_mouse = 1;

      sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

      touchpad = {
        natural_scroll = true;
      };

      numlock_by_default = true;
    };

    gestures = {
      workspace_swipe = true;
    };
  };
}
