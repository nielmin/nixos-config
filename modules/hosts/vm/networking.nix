{
  flake.modules.nixos.host_vm = {
    networking = {
      hostName = "vm";
      nftables.enable = true;
      firewall = {
        enable = false;
      };
    };
  };
}
