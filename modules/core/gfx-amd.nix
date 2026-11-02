{ inputs, ... }: {
  flake.modules.nixos.gfx-amd =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
      };
    };
}
