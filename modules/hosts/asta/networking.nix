{
  flake.modules.nixos.host_asta =
  { lib, ... }:
  {
    networking = {
      hostName = "asta"; # Define your hostname.
      useDHCP = lib.mkDefault true;

      networkmanager = {
        wifi.backend = "iwd";
      };
      
      wireless.iwd = {
        enable = true;
      };
    };
  };
}
