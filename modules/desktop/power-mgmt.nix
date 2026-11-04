{ inputs, ... }: {
  flake.modules.nixos.power-mgmt = { pkgs, ... }: {
    services = {
      power-profiles-daemon.enable = false;

      tlp = {
        enable = true;
        pd.enable = true;
      };
    };
  };
}
