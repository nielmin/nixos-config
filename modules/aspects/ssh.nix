{den, ...}: {
  den.aspects.ssh = {
    nixos = {pkgs, ...}: {
      services.openssh = {
        enable = true;
      };
    };
  };
}
