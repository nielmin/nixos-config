{ config, lib, pkgs, ...}:
with lib;

let
  cfg = config.desktop.hyprland; in {

  options ={
    desktop.hyprland.enable = lib.mkEnableOption "Enable Hyprland";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
      withUWSM = true;
    };

    environment.systemPackages = with pkgs; [
      fuzzel 
      kitty
      nwg-look
      papirus-icon-theme
      phinger-cursors
    ];
  };
}
