{ config, lib, pkgs, ...}:
with lib;
let
  cfg = config.hwacc; in {
  options = {
    hwacc.enable = lib.mkEnableOption "Enable hardware acceleration";
    };

  config = lib.mkIf cfg.enable {
    nixpkgs.config.packageOverrides = pkgs: {
       intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
     };
     hardware.graphics = { # hardware.graphics since NixOS 24.11
       enable = true;
       extraPackages = with pkgs; [
         intel-media-driver # LIBVA_DRIVER_NAME=iHD
         intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
         libvdpau-va-gl
       ];
     };
     environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; }; # Force intel-media-driver
  };   
}
