{ pkgs, lib, username, ... }:

{
  users.users.${username} = {
    isNormalUser = true;
    description = "Daniel Hwang";
    extraGroups = [ "networkmanager" "wheel" "video" "render" ];
  };

  nix = {
    settings = {
      # Enable the Flakes feature and the accompanying new nix command-line tool
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      download-buffer-size = 52488000;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable networking
  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable CUPS to print documents.
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    udev.enable = true;
    printing.enable = true;

    thermald.enable = true;

    fwupd.enable = true;
  };

  environment.systemPackages = with pkgs; [
    efibootmgr
    dconf
    acpi
    libva-utils
    intel-gpu-tools
    sbctl
  ];

  programs.dconf.enable = true;

  powerManagement.enable = true;

  security.rtkit.enable = true;
}
