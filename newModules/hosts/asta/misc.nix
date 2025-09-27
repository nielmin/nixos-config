{
  flake.modules.nixos.host_asta = {
    networking.hostName = "asta"; # Define your hostname.
    system.stateVersion = "24.11"; # Did you read the comment?
  };
}
