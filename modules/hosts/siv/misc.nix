{
  flake.modules.nixos.host_siv = {
    networking.hostName = "nuc";
    system.stateVersion = "25.11";
  };
}
