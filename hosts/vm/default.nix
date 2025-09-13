# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ../../modules/common.nix
    ../../modules/homelab
    ./boot.nix
    inputs.disko.nixosModules.disko
    (import ./disk.nix { inherit lib; })
    ./hardware-configuration.nix
    ];

  networking.hostName = "vm"; # Define your hostname.
  
  # List services that you want to enable:
  
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  users.users.root.openssh.authorizedKeys.keys =
  [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPRkbcVwMaIfasq2qg6/ZsNz8i37JPUQHZJPBU6c80p1 dawh@ines"
  ];

  
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
