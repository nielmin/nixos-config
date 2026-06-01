{
  nlm,
  __findFile,
  ...
}: {
  nlm.kvm-intel = {
    includes = [
      <nlm/gfx-intel>
    ];
    nixos = {
      lib,
      config,
      ...
    }: {
      boot.kernelModules = ["kvm-intel"];
      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
      services.undervolt = {
        enable = true;
        coreOffset = -70;
      };
    };
  };
}
