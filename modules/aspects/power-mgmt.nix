{
  flake.modules.nixos.power-mgmt = {
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
