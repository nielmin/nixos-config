{ pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
      bind = [
          "$mainMod, Return, exec, $terminal"
          "$mainMod SHIFT, E, exit" 
          "$mainMod, D, exec, $menu"

          "$mainMod, Q, killactive,"

          "$mainMod, h, movefocus, l"
          "$mainMod, l, movefocus, r"
          "$mainMod, k, movefocus, u"
          "$mainMod, j, movefocus, d"

          "$mainMod, V, togglefloating"
          "$mainMod, V, centerwindow"
          "$mainMod SHIFT, P, pseudo, " # dwindle
          "$mainMod, J, togglesplit, " # dwindle

          "$mainMod, mouse_down, movetoworkspace, e+1"
          "$mainMod, mouse_up, movetoworkspace, e-1"

          ", PRINT, exec, hyprshot -m region"

          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"

          "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
          "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
          "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
          "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
          "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
          "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
          "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
          "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
          "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
          "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
          ];
      bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
      ];
      bindl = [
          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPause, exec, playerctl play-pause"
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioPrev, exec, playerctl previous"
      ];
      bindel = [
          ",XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise --max-volume 100"
          ",XF86AudioLowerVolume, exec, swayosd-client --output-volume lower --max-volume 100"
          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          ",XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
          ",XF86MonBrightnessDown, exec, swayosd-client --brightness lower"
      ];
  };
}
