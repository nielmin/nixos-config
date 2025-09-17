{ lib, ... }:

{
  imports = [
      ./disko.nix
      ./hardware.nix
    ];

  networking.hostName = "asta"; # Define your hostname.
  system.stateVersion = "24.11"; # Did you read the comment?
}
