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
      grim
      slurp
      wl-clipboard
    ];

    security.polkit.enable = true;

    security.pam.services.swaylock = {};

    environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
