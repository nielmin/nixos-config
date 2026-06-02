{nlm, ...}: {
  nlm.gfx-amd = {
    nixos = {pkgs, ...}: {
      hardware = {
        graphics = {
          enable = true;
          enable32Bit = true;
        };
        amdgpu.overdrive.enable = true;
      };
      services.lact = {
        enable = true;
      };
    };
  };
}
