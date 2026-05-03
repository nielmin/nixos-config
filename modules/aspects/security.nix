{den, ...}: {
  den.aspects.security = {
    nixos = {pkgs, ...}: {
      security = {
        sudo  = {
          enable = true;
          wheelNeedsPassword = false;
        };
      };
    };
  }
}
