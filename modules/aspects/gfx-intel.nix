{
  flake.modules.nixos.gfx-intel = { pkgs, ... }: {
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vpl-gpu-rt
      ];
    };
    environment.sessionVariables = {
      LIBVA_DRIVER_NAME = "iHD";
    };
  };
}
