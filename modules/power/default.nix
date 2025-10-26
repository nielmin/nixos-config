{
  flake.modules.nixos.power =
  { pkgs, ... }:
  {
    environment.systemPackages = with pkgs; [
      acpi
      acpid
    ];

    services = {
      thermald.enable = true;

      tlp = {
        enable = true;
        settings = {
          START_CHARGE_THRESH_BAT0=50
          STOP_CHARGE_THRESH_BAT0=80
          
          START_CHARGE_THRESH_BAT1=50
          STOP_CHARGE_THRESH_BAT1=80
        };
      };
    };
  };
}
