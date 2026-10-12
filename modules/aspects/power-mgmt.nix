{
  flake.modules.nixos.power-mgmt = {
    powerManagement.enable = true;
    services = {
      power-profiles-daemon.enable = false;

      tlp = {
        enable = true;
        pd.enable = true;
      };
    };
  };

  flake.modules.homeManager.power-mgmt = { };
}
