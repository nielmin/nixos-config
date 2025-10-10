{
  flake.modules.nixos.host_vm = {
    networking.hostName = "vm";

    system.stateVersion = "24.11";
  };
}
