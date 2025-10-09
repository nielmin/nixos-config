{
  flake.modules.homeManager.waybar = {
  programs.waybar.settings.mainBar = {
    layer = "top";
    position = "top";
    height = 40;
    modules-left = [ "hyprland/workspaces" "sway/workspaces" "niri/workspaces" ];
    modules-center = [ "custom/music" ];
    modules-right = [ "backlight" "battery" "clock" "tray" "custom/lock" "custom/power" ];

    "hyprland/workspaces" = {
      disable-scroll = true;
      sort-by-name = true;
      format = " {icon} ";
      format-icons.default = "";
    };

    "sway/workspaces" = {
      disable-scroll = true;
      sort-by-name = true;
      format = " {icon} ";
      format-icons.default = "";
    };

    "niri/workspaces" = {
      disable-scroll = true;
      sort-by-name = true;
      format = " {icon} ";
      format-icons.default = "";
    };

    tray = {
      icon-size = 21;
      spacing = 10;
    };

    "custom/music" = {
      format = "  {}";
      escape = true;
      interval = 5;
      tooltip = false;
      exec = "playerctl metadata --format='{{ title }}'";
      on-click = "playerctl play-pause";
      max-length = 50;
    };

    clock = {
      timezone = "America/Chicago";
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      format-alt = " {:%d/%m/%Y}";
      format = " {:%H:%M}";
    };

    backlight = {
      device = "intel_backlight";
      format = "{icon}";
      format-icons = [ "" "" "" "" "" "" "" "" "" ];
    };

    battery = {
      states = {
        warning = 30;
        critical = 15;
      };
      format = "{icon}  {capacity}%";
      format-charging = "";
      format-plugged = "";
      format-icons = ["" "" "" "" ""];
    };

    pulseaudio = {
      format = "{icon} {volume}%";
      format-muted = "";
      format-icons.default = [ "" "" "" ];
      on-click = "pavucontrol";
    };

    "custom/lock" = {
      tooltip = false;
      on-click = "sh -c '(sleep 0.5s; swaylock --grace 0)' & disown";
      format = "";
    };

    "custom/power" = {
      tooltip = false;
      on-click = "wlogout &";
      format = "襤";
    };
  };
  };
}
