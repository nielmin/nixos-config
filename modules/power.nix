{ pkgs, ... }:

{
  services = {
    tlp = {
      enable = true;
      settings = {
        START_CHARGE_THRESH_BAT0 = 60;
        STOP_CHARGE_THRESH_BAT0 = 85;

        START_CHARGE_THRESH_BAT1 = 60;
        STOP_CHARGE_THRESH_BAT1 = 85;
      };
    };
  };
}
