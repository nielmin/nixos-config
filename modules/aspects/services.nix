{den, ...}: {
  den.aspects.services = {
    nixos = {pkgs, ...}: {
      services.undervolt = {
        enable = true;
        coreOffset = -70;
      };
    };
    homeManager = {pkgs, ...}: {
      services.syncthing = {
        enable = true;
      };
    };
  };
}
