{
  inputs,
  ...
}:
{
  flake.modules.nixos.cpu-intel = { lib, config, ... }: {
    imports = with inputs.self.modules.nixos; [
      gfx-intel
    ];
    boot.kernelModules = [ "kvm-intel" ];
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    services.undervolt = {
      enable = true;
      coreOffset = -70;
    };
  };
}
