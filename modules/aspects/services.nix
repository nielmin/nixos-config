{ den, ... }: {
  den.aspects.services = {
    nixos = { pkgs, ... }: {
      services.undervolt = {
        enable = true;
        coreOffset = -50;
      };
    };
    homeManager = { pkgs, ... }: {
      services.syncthing = {
        enable = true;
      };
    };
  };
}
