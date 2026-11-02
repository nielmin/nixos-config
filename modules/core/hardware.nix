{
  flake.modules.nixos.hardware = {
    powerManagement.enable = true;
    hardware = {
      bluetooth = {
        enable = true;
        powerOnBoot = true;
      };
      uinput = {
        enable = true;
      };
    };
  };
}
