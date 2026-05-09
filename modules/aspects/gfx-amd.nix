{den, ...}: {
  den.aspects.gfx-amd = {
    nixos = {pkgs, ...}: {
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
      };
    };
  };
}
