{ den, ... }: {
  den.aspects.services = {
    nixos = { pkgs, ... }: {
      services.undervolt = {
        enable = true;
      };
    };
    homeManager = { pkgs, ... }: { };
  };
}
