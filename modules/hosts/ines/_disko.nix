{
  # fileSystems."/nix".neededForBoot = true;
  # fileSystems."/persist".neededForBoot = true;
  # disko.devices.nodev = {
  #   "/" = {
  #     fsType = "tmpfs";
  #     mountOptions = [
  #       "size=25%"
  #       "mode=755"
  #     ];
  #   };
  # };
  disko.devices = {
    disk = {
      one = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-WD_Blue_SN570_500GB_214561803667";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              priority = 1;
              name = "ESP";
              size = "1024M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["umask=0077"];
              };
            };
            root = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = ["-f"]; # Override existing partition
                # Subvolumes must set a mountpoint in order to be mounted,
                # unless their parent is mounted
                subvolumes = {
                  "/root" = {
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
		      "subvol=root"
                    ];
                    mountpoint = "/";
                  };
                  # Parent is not mounted so the mountpoint must be set
                  "/nix" = {
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
		      "subvol=persist"
                    ];
                    mountpoint = "/nix";
                  };
                  # "/persist" = {
                  #   mountOptions = [
                  #     "compress=zstd"
                  #     "noatime"
		  #     "subvol=nix"
                  #   ];
                  #   mountpoint = "/persist";
                  # };
                };
              };
            };
          };
        };
      };
      two = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-Samsung_SSD_970_EVO_Plus_1TB_S59ANS0WB16409Y";
	content = {
	  type = "gpt";
	  partitions = {
	    home = {
	      size = "100%";
	      content = {
	        type = "btrfs";
		extraArgs = ["-f"];
                subvolumes = {
                  # Subvolume name is the same as the mountpoint
                  "/home" = {
                    mountOptions = ["compress=zstd" "subvol=home" ];
                    mountpoint = "/home";
                  };
		};
	      };
	    };
	  };
	};
      };
    };
  };
}
