{
  flake.modules.nixos.host_asta =
  { lib, ... }:
  {
    systemd.network = {
      enable = true;
      networks = {
        "20-wired" = {
         matchConfig.Name = "en*";
         networkConfig = {
           DHCP = "yes";
         };
         linkConfig = {
           RequiredForOnline = "no";
           };
        };

        "25-wireless" = {
         matchConfig.Name = "wl*";
         networkConfig = {
           DHCP = "yes";
         };
        };
      };
    };

    networking = {
      hostName = "asta"; # Define your hostname.
      # useDHCP = lib.mkDefault true;
      dhcpcd.enable = false;

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
