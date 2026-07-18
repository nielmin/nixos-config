{nlm, ...}: {
  nlm.power-mgmt = {
    nixos = {pkgs, ...}: {
      services = {
        power-profiles-daemon.enable = false;

        tlp = {
          enable = true;
          pd.enable = true;
        };
      };
    };
  };
}
