{
  flake.modules.nixos.host_printer = {
    networking.hostName = "printer"; # Define your hostname.
    system.stateVersion = "25.11"; # Did you read the comment?
  };
}
