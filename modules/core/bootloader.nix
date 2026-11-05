{
  inputs,
  ...
}:
{
  flake.modules.nixos.bootloader =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      options = {
        bootloader.enable = lib.mkEnableOption "systemd-boot bootloader";
      };

      config = {
        boot = {
          initrd.kernelModules = [ ];
          loader = {
            efi.canTouchEfiVariables = true;
            systemd-boot = {
              enable = true;
              configurationLimit = 20;
            };
          };
        };

      };
    };
}
