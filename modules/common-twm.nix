{ pkgs, ... }:

{
    programs.waybar.enable = true;

    fonts.packages = with pkgs; [
      font-awesome
    ];

    environment.systemPackages = with pkgs; [
      fuzzel 
      nwg-look
      brightnessctl
      fnott
      wlogout
      swaylock
      playerctl
    ];
}
