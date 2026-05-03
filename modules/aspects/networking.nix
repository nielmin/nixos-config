{den, ...}: {
  den.aspects.networking = {
    nixos = {pkgs, ...}: {
      networking = {
        networkmanager.enable = true;
      };
    };
  };
}
