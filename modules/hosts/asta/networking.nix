{
  flake.modules.nixos.host_asta =
  { lib, ... }:
  {
    systemd.network = {
      enable = true;
      networks  = {
        "40-enp0s31f6" = {
          matchConfig.Name = "enp0s31f6";
          networkConfig.DHCP = "yes";
          linkConfig.RequiredForOnline = "no";
        };

        "40-wlp3s0" = {
          matchConfig.name = "wlp3s0";
          networkConfig.DHCP = "yes";
          linkConfig.RequiredForOnline = "no";
        };
      };

      links = {
        "40-enp0s31f6" = {
         matchConfig.Name = "enp0s31f6";
        };

        "40-wlp3s0" = {
         matchConfig.name = "wlp3s0";
        };
      };
    };

    networking = {
      hostName = "asta"; # Define your hostname.
      # useDHCP = lib.mkDefault true;
      dhcpcd.enable = false;

      # networkmanager = {
      #   wifi.backend = "iwd";
      # };
      
      # wireless.iwd = {
      #   enable = true;
      #   settings = {
      #     General = {
      #       EnableNetworkConfiguration = true;
      #     };
      #     Settings = {
      #       AutoConnect = true;
      #     };
      #   };
      # };

    };
  };
}
