{den, ...}: {
  den.aspects.services = {
    nixos = {pkgs, ...}: {
      services.undervolt = {
        enable = true;
        coreOffset = -70;
      };
      services.fwupd.enable = true;
    };
    homeManager = {pkgs, ...}: {
      services.syncthing = {
        enable = true;
      };
    };
  };
}
