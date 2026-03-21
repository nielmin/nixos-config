{ den, ... }: {
  den.aspects.bootable = {
    nixos = { modulesPath, pkgs, ... }: {
      imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      boot.kernelPackages = pkgs.linuxPackages_latest;
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ "kvm-intel" ];
      boot.extraModulePackages = [ ];

      hardware.bluetooth = {
        enable = true;
	powerOnBoot = true;
      };

      security.rtkit.enable = true;
      services = {
	pulseaudio.enable = false;
	pipewire = {
	  enable = true;
	  alsa.enable = true;
	  alsa.support32Bit = true;
	  pulse.enable = true;
	};
      };
    };
  };
}
