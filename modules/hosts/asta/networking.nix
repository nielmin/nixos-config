{
  flake.modules.nixos.host_asta = {
    networking = {
      hostName = "asta"; # Define your hostname.
      useDHCP = lib.mkDefault true;

      wireless.iwd = {
        enable = true;
        settings = {
          IPv6 = {
            Enabled = true;
          };
          Settings = {
            AutoConnect = true;
          };
        };
      };
    };
  };
}
