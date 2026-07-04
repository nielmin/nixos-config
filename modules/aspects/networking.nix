{nlm, ...}: {
  nlm.networking = {host, ...}: {
    nixos = {
      networking.hostName = host.name;
    };
  };
}
