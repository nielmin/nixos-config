{ inputs, ... }: {
  flake.modules.nixos.smb-server = { pkgs, ... }: {
    sops.secrets = {
      "samba" = {
        key = "samba";
        owner = "root";
      };
    };

    services.samba = {
      enable = true;
      openFirewall = true;
      settings = {
        global = {
          "usershare max shares" = 100;
          "create mask" = "0755";
          "directory mask" = "2755";
          "force create mode" = "0755";
          "force directory mode" = "2755";
        };

        emi = {
          path = "/epool/data";
          browseable = true;
          writable = true;
        };

        kai = {
          path = "/kpool/media";
          browseable = true;
          writable = true;
        };

        mari = {
          path = "/kpool/data";
          browseable = true;
          writable = true;
        };
      };
    };

    services.samba-wsdd = {
      enable = true;
      openFirewall = true;
    };
  };
}
