{nlm, ...}: {
  nlm.networking = {host, ...}: {
    nixos = {
      networking = {
        hostName = host.name;
        nftables.enable = true;
      };
    };
  };
}
