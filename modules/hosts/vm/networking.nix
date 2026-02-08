{
  flake.nixosModules.vm = {
    networking = {
      nftables.enable = true;
      firewall = {
        enable = false;
      };
    };
  };
}
