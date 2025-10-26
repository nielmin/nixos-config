{
  flake.modules.nixos.power = {
    environment.systemPackages = with pkgs; [
      acpi
      acpid
    ];

    services = {
      thermald.enable = true;

      tlp = {
        enable = true;
        settings = {
          #Optional helps save long term battery health
          START_CHARGE_THRESH_BAT0 = 40; # 40 and below it starts to charge
          STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
        };
      };
    };
  };
}
