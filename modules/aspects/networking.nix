{
  flake.modules.nixos.networking = {
    networking = {
      nftables.enable = true;
    };
  };
}
