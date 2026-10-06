{
  nlm,
  __findFile,
  ...
}:
{
  nlm.cpu-amd = {
    includes = [
      <nlm/gfx-amd>
    ];
    nixos =
      {
        lib,
        config,
        ...
      }:
      {
        boot.kernelModules = [ "kvm-amd" ];
        hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
      };
  };
}
