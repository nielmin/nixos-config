{
  flake.modules.nixos.networking = { host, ... }: {
    networking = {
      hostName = host.name;
      nftables.enable = true;
    };
  };
}
