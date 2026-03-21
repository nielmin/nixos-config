{ den, ... }: {
  den.aspects.networking = {
    nixos = { pkgs, ... }: {
      networking = {
        hostName = "asta";
	networkmanager.enable = true;
      };
    };
  };
}
