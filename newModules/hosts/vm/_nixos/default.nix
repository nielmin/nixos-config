{ lib, ... }:

{
  imports = [
    ./disko.nix
    ./hardware.nix

  ];

  networking.hostName = "vm";
    
  services.openssh.enable = true;

  users.users.root.openssh.authorizedKeys.keys =
  [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPRkbcVwMaIfasq2qg6/ZsNz8i37JPUQHZJPBU6c80p1 dawh@ines"
  ];

  system.stateVersion = "24.11"; # Did you read the comment?
}
