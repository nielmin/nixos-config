{ pkgs, ... }:

{
  wayland.windowManager.hyprland.settings.windowrule = [
    "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

    "float,class:^(nwg-look)$,title:^(nwg-look)$"
    "size 40% 40%,class:^(nwg-look)$,title:^(nwg-look)$"

    "center,class:^(firefox)$,title:^(firefox)$"
    "size 30% 30%,class:^(firefox)$,title:^(firefox)$"

    # Ignore maximize requests from apps. You'll probably like this.
    "suppressevent maximize, class:.*"

    # Fix some dragging issues with XWayland
    "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:"

    "center, class:xdg-desktop-portal-gtk"
    "float, class:xdg-desktop-portal-gtk"
    "size 50% 50%, class:xdg-desktop-portal-gtk"
  ];
}
