{ lib, ... }:

{
  imports = [
    ./disko.nix
    ./hardware.nix

  ];

  networking.hostName = "vm";
    
  system.stateVersion = "24.11"; # Did you read the comment?
}
