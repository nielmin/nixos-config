{ pkgs, ... }:

{
    programs.waybar.enable = true;

    fonts.packages = with pkgs; [
      adwaita-fonts
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
      adwaita-icon-theme
      morewaita-icon-theme

    ];

    security.polkit.enable = true;

    security.pam.services.swaylock = {};

    environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
