{
  flake.modules.nixos.host_nuc = {
    networking.hostName = "nuc"; # Define your hostname.
    system.stateVersion = "24.11"; # Did you read the comment?
  };
}
