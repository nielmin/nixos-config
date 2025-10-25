{
  flake.modules.homeManager.waybar = {
    programs.waybar.settings.mainBar = {
      layer = "top";
      position = "top";
      modules-left = [
        "niri/workspaces"
        "group/hardware"
      ];
      modules-center = [ "niri/window" ];
      modules-right = [
        "custom/music"
        "bluetooth"
        "network"
        "wireplumber"
        "battery"
        "clock"
        "group/group-power"
        "tray"
      ];

      cpu = {
        interval = 10;
        format = "{}% ";
        max-length = 10;
      };

      memory = {
        interval = 30;
        format = "{used:0.1f}G ";
      };

      "custom/stats" = {
        format = "";
        tooltip = false;
      };

      "group/hardware" = {
        orientation = "inherit";
        drawer = {
          transition-duration = 300;
          children-class = "stats";
          transition-left-to-right = true;
        };
        modules = [
          "custom/stats"
          "cpu"
          "memory"
        ];
      };

      "niri/workspaces" = {
        disable-scroll = true;
        sort-by-name = true;
        format = " {icon} ";
        format-icons.default = "";
        format-icons.active = "";
      };

      "niri/window" = {
        format = "{app_id}";
        icon = true;
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
        max-length = 40;
      };

      clock = {
        timezone = "America/Chicago";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = " {:%d/%m/%Y}";
        format = "{:%H:%M}";
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

      bluetooth = {
        format = " {status}";
        format-connected = " {device_alias}";
        format-connected-battery = " {device_alias} {device_battery_percentage}%";
        tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
        tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
        tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
        tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
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
        format = "{icon} {capacity}%";
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
        on-click = "pwvucontrol";
      };

      "custom/quit" = {
        format = "󰗼";
        tooltip = false;
        on-click = "hyprctl dispatch exit";
      };
      "custom/lock" = {
        format = "󰍁";
        tooltip = false;
        on-click = "swaylock";
      };
      "custom/reboot" = {
        format = "󰜉";
        tooltip = false;
        on-click = "reboot";
      };
      "custom/power" = {
        format = "";
        tooltip = false;
        on-click = "shutdown now";
      };

      "group/group-power" = {
        orientation = "inherit";
        drawer = {
          transition-duration = 300;
          children-class = "not-power";
          transition-left-to-right = false;
        };
        modules = [
          "custom/power"
          "custom/quit"
          "custom/lock"
          "custom/reboot"
        ];
      };
    };
  };
}
