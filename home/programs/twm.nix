{ config, lib, pkgs, ... }:
with lib;

let
  cfg = config.home.twm.programs; in {

  options = {
    home.twm.programs.enable = lib.mkEnableOption "Enable TWM user programs";
  };

  config = lib.mkIf cfg.enable {
    programs = {
      fuzzel = {
        enable = true;
        settings = {
          main = {
            icon-theme = "MoreWaita";
          };
          colors.background = "090E13FF";
          colors.text = "C5C9C7FF";
          colors.match = "938aa9ff";
          colors.selection-match = "938aa9ff";
          colors.selection = "393B42FF";
          colors.selection-text = "C5C9C7FF";
          colors.border = "c4746eff";
        };
      };
      eww = {
        enable = true;
      };
      ironbar = {
        enable = false;
        systemd = false;
        config = {
          monitors = {
            eDP-1 = {
              anchor_to_edges = true;
              position = "top";
              height = 16;
              start = [
              { type = "workspaces";
                all_monitors = false;
                name_map = {
                  "1" = "󰙯";
                  "2" = "icon:firefox";
                  "3" = "";
                  "Games" =  "icon:steam";
                  "Code" = "";
                };
              }
              ];
              center = [
              {
                type = "clock";
              }
              ];
              end = [
              {
                "format"= [
                  " {cpu_percent}% | {cpu_frequency} GHz | {temp_c@CPUTIN}°C"
                  " {memory_used} / {memory_total} GB ({memory_available} | {memory_percent}%) | {swap_used} / {swap_total} GB ({swap_free} | {swap_percent}%)"
                  "󰓢 {net_down@enp39s0} / {net_up@enp39s0} Mbps"
                ];
                "interval" = {
                  "cpu" = 1;
                  "disks" = 300;
                  "memory" = 30;
                  "networks" = 3;
                  "temps" = 5;
                };
                type = "sys_info";
              }
              {
                type = "tray";
                icon_size = 16;
              }
              ];
            };
          };
        };
        style = /* css */ ''
          /* An example */
          * {
            font-family: Noto Sans Nerd Font, sans-serif;
            font-size: 16px;
            border: none;
            border-radius: 0;
          }
        '';
      };
    };
  };
  }
