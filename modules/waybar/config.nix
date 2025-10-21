{
  flake.modules.homeManager.waybar = {
    programs.waybar.settings.mainBar = {
      layer = "top";
      position = "top";
      modules-left = [ "niri/workspaces" ];
      modules-center = [ "niri/window" ];
      modules-right = [
        "wireplumber"
        "backlight"
        "battery"
        "network"
        "clock"
        "tray"
        "custom/lock"
        "custom/power"
      ];

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

      "niri/window" = {
        format = "{app_id}";
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

      network = {
        format = "{ifname}";
        format-wifi = " ";
        format-ethernet = " ";
        format-disconnected = " ";
        tooltip-format = " {ifname} via {gwaddr}";
        tooltip-format-wifi = " {essid} ({signalStrength}%)";
        tooltip-format-ethernet = " {ifname} {ipaddr}/{cidr}";
        tooltip-format-disconnected = "Disconnected";
        max-length = 50;
      };

      backlight = {
        device = "intel_backlight";
        format = "{icon}";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
          ""
          ""
          ""
          ""
        ];
      };

      battery = {
        states = {
          good = 95;
          warning = 30;
          critical = 20;
        };
        format = "{icon}";
        format-charging = " {capacity}%";
        format-plugged = " {capacity}%";
        format-alt-click = "click-right";
        format-alt = "{icon} {capacity}%";
        format-icons = [
          "󰂎"
          "󰁺"
          "󰁻"
          "󰁼"
          "󰁽"
          "󰁾"
          "󰁿"
          "󰂀"
          "󰂁"
          "󰂂"
          "󰁹"
        ];
      };

      wireplumber = {
        format = "{volume}% {icon}";
        format-muted = "";
        format-icons.default = [
          ""
          ""
          ""
        ];
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
