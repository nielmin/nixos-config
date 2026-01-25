{
  flake.modules.nixos.host_asta =
    { lib, ... }:
    {
      systemd.network = {
        enable = true;
        networks = {
          "40-enp0s31f6" = {
            matchConfig.Name = "enp0s31f6";
            networkConfig.DHCP = "yes";
            linkConfig.RequiredForOnline = "no";
          };

          "40-wlp3s0" = {
            matchConfig.Name = "wlp3s0";
            networkConfig.DHCP = "yes";
          };
        };

        links = {
          "80-iwd".enable = false;
        };
      };

      networking = {
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
