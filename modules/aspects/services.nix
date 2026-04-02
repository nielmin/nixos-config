{ den, ... }: {
  den.aspects.services = {
    nixos = { pkgs, ... }: { };
    homeManager = { pkgs, ... }: { };
  };
}
