{
  flake.modules.nixos.host_asta =
  { lib, ... }:
  {
    networking = {
      hostName = "asta"; # Define your hostname.
      useDHCP = false;

      networkmanager = {
        wifi.backend = "iwd";
      };
      
      wireless.iwd = {
        enable = true;
        settings = {
          General = {
            EnableNetworkConfiguration = true;
          };
          Settings = {
            AutoConnect = true;
          };
        };
      };

    };
  };
}
