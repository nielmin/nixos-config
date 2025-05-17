{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gnomeExtensions.battery-health-charging
    gnomeExtensions.tray-icons-reloaded
  ];
}
