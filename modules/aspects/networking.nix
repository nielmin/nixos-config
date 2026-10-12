{
  flake.modules.nixos.networking = {
    networking = {
      nftables.enable = true;
      networkmanager.enable = true;
    };
  };
}
