{ inputs, ... }: {
  flake.modules.nixos.cpu-amd =
    {
      lib,
      config,
      ...
    }:
    {
      imports = with inputs.self.modules.nixos; [
        gfx-amd
      ];

      boot.kernelModules = [ "kvm-amd" ];
      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
