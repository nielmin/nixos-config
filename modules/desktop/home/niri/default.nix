{ inputs, ... }:
{
  flake.modules.homeManager.niri =
    { pkgs, config, ... }:
    {
      imports = [
        inputs.niri.homeModules.niri
      ];

      programs.fuzzel = {
        enable = true;
      };

      services.mako = {
        enable = true;
      };

      programs.niri = {
        enable = true;
        settings = {
          prefer-no-csd = true;

          cursor = {
            theme = "Bibata-Modern-Amber";
          };

          input = {
            keyboard = {
              xkb.options = "ctrl:nocaps";
            };


            mod-key = "Super";
          };

          # Output configuration
          outputs = {
            "eDP-1" = {
              mode.width = 1920;
              mode.height = 1080;
              scale = 1.0;
              position = {
                x = 0;
                y = 0;
              };
            };
          };
          
          layout = {
            gaps = 16;
            focus-ring = {
              active.color = "#7fc8ff";
              inactive.color = "#505050";
            };

            border = {
              active.color = "#ffc87f";
              inactive.color = "#505050";
              urgent.color = "#9b0000";
            };

            shadow = {
              enable = true;
              softness = 30;
              spread = 5;
              offset.x = 0;
              offset.y = 5;
              color = "#0007";  
            };

            struts = {};
            
            preset-column-widths = [
              { proportion = 1. / 3.; }
              { proportion = 1. / 2.; }
              { proportion = 2. / 3.; }
            ];

            default-column-width = {
              proportion = 0.5;

            };
          };
          # Basic keybindings
          binds = with config.lib.niri.actions; {
            # "Mod+Shift+Slash".action.show-hotkey-overlay;
            "Mod+T".action.spawn = "alacritty";
            "Mod+D".action.spawn = "fuzzel";
            "Mod+Q".action.close-window = [];

            "Mod+Left".action = focus-column-left;
            "Mod+Down".action = focus-window-down;
            "Mod+Up".action = focus-window-up;
            "Mod+Right".action = focus-column-right;

            "Mod+H".action = focus-column-left;
            "Mod+J".action = focus-window-down;
            "Mod+K".action = focus-window-up;
            "Mod+L".action = focus-column-right;

            "Mod+Ctrl+Left".action = move-column-left;
            "Mod+Ctrl+Down".action = move-window-down;
            "Mod+Ctrl+Up".action = move-window-up;
            "Mod+Ctrl+Right".action = move-column-right;
            
            "Mod+Ctrl+H".action = move-column-left;
            "Mod+Ctrl+J".action = move-window-down;
            "Mod+Ctrl+K".action = move-window-up;
            "Mod+Ctrl+L".action = move-column-right;

            "Mod+Home".action = focus-column-first;
            "Mod+End".action = focus-column-last;
            "Mod+Ctrl+Home".action = move-column-to-first;
            "Mod+Ctrl+End".action = move-column-to-last;

            "Mod+Shift+Left".action = focus-monitor-left;
            "Mod+Shift+Down".action = focus-monitor-down;
            "Mod+Shift+Up".action = focus-monitor-up;
            "Mod+Shift+Right".action = focus-monitor-right;

            "Mod+Shift+H".action = focus-monitor-left;
            "Mod+Shift+J".action = focus-monitor-down;
            "Mod+Shift+K".action = focus-monitor-up;
            "Mod+Shift+L".action = focus-monitor-right;

            "Mod+Ctrl+Shift+Left".action = move-column-to-monitor-left;
            "Mod+Ctrl+Shift+Down".action = move-column-to-monitor-down;
            "Mod+Ctrl+Shift+Up".action = move-column-to-monitor-up;
            "Mod+Ctrl+Shift+Right".action = move-column-to-monitor-right;

            "Mod+Ctrl+Shift+H".action = move-column-to-monitor-left;
            "Mod+Ctrl+Shift+J".action = move-column-to-monitor-down;
            "Mod+Ctrl+Shift+K".action = move-column-to-monitor-up;
            "Mod+Ctrl+Shift+L".action = move-column-to-monitor-right;

            "Mod+Page_Down".action = focus-workspace-down;
            "Mod+Page_Up".action = focus-workspace-up;
            "Mod+U".action = focus-workspace-down;
            "Mod+I".action = focus-workspace-down;
            "Mod+Ctrl+Page_Down".action = move-column-to-workspace-down;
            "Mod+Ctrl+Page_Up".action = move-column-to-workspace-up;
            "Mod+Ctrl+U".action = move-column-to-workspace-down;
            "Mod+Ctrl+I".action = move-column-to-workspace-down;

            "Mod+1".action = focus-workspace 1;
            "Mod+2".action = focus-workspace 2;
            "Mod+3".action = focus-workspace 3;
            "Mod+4".action = focus-workspace 4;
            "Mod+5".action = focus-workspace 5;
            "Mod+6".action = focus-workspace 6;
            "Mod+7".action = focus-workspace 7;
            "Mod+8".action = focus-workspace 8;
            "Mod+9".action = focus-workspace 9;
            "Mod+Ctrl+1".action = move-column-to-index 1;
            "Mod+Ctrl+2".action = move-column-to-index 2;
            "Mod+Ctrl+3".action = move-column-to-index 3;
            "Mod+Ctrl+4".action = move-column-to-index 4;
            "Mod+Ctrl+5".action = move-column-to-index 5;
            "Mod+Ctrl+6".action = move-column-to-index 6;
            "Mod+Ctrl+7".action = move-column-to-index 7;
            "Mod+Ctrl+8".action = move-column-to-index 8;
            "Mod+Ctrl+9".action = move-column-to-index 9;

            "Mod+BracketLeft".action = consume-or-expel-window-left;
            "Mod+BracketRight".action = consume-or-expel-window-right;

            "Mod+Comma".action = consume-window-into-column;
            "Mod+Period".action = expel-window-from-column;

            "Mod+R".action = switch-preset-column-width;
            "Mod+Shift+R".action = switch-preset-window-height;
            "Mod+Ctrl+R".action = reset-window-height;
            "Mod+F".action = maximize-column;
            "Mod+Shift+F".action = fullscreen-window;
            "Mod+Ctrl+F".action = expand-column-to-available-width;

            "Mod+C".action = center-column;
            "Mod+Ctrl+C".action = center-visible-columns;

            "Mod+Minus".action = set-column-width "-10%";
            "Mod+Equal".action = set-column-width "+10%";
            
            "Mod+Shift+Minus".action = set-window-height"-10%";
            "Mod+Shift+Equal".action = set-window-height"+10%";
            
            "Mod+V".action = toggle-window-floating;
            "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;

            "Mod+W".action = toggle-column-tabbed-display;

            "Print".action = screenshot;
            "Ctrl+Print".action = screenshot { show-pointer=false; };
            "Alt+Print".action = screenshot-window;

            "Mod+Escape".action = toggle-keyboard-shortcuts-inhibit;

            "Mod+Shift+E".action = quit;
            "Ctrl+Alt+Delete".action = quit;

            "Mod+Shift+P".action = power-off-monitors;
          };
          
          # Startup applications
          spawn-at-startup = [
            { command = ["waybar"]; }
            { command = ["mako"]; }
          ];
        };
      };    
    };
}
