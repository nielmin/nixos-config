{nlm, ...}: {
  nlm.security = {
    nixos = {pkgs, ...}: {
      security = {
        sudo = {
          enable = true;
          wheelNeedsPassword = false;
        };
      };
    };
  };
}
