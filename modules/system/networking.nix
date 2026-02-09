{
  flake.modules.nixos.networking = {
    networking = {
      networkmanager.enable = true;
      nftables.enable = true;
      firewall = {
        enable = false;
      };
    };
  };
}
