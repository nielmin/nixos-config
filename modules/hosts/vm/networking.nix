{
  flake.modules.nixos.host_vm = {
    networking = {
      nftables.enable = true;
      firewall = {
        enable = false;
      };
    }; 
  };
}
