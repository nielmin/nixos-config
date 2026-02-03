{
  flake.nixosModules.plasma =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        kdePackages.discover # Optional: Install if you use Flatpak or fwupd firmware update sevice
        kdePackages.kcalc # Calculator
        kdePackages.ksystemlog # KDE SystemLog Application
        kdePackages.sddm-kcm # Configuration module for SDDM
        kdiff3 # Compares and merges 2 or 3 files or directories
        kdePackages.isoimagewriter # Optional: Program to write hybrid ISO files onto USB disks
        kdePackages.xdg-desktop-portal-kde
        kdePackages.partitionmanager # Optional Manage the disk devices, partitions and file systems on your computer
        hardinfo2 # System information and benchmarks for Linux systems
        wayland-utils # Wayland utilities
        wl-clipboard # Command-line copy/paste utilities for Wayland
      ];

      services = {
        desktopManager.plasma6.enable = true;
        displayManager.sddm.enable = true;
        displayManager.sddm.wayland.enable = true;
        geoclue2.enable = true;
      };

      xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-gtk
        ];
        config.common.default = "*";
      };
    };
}
