{
  nlm.smb-server = {
    nixos =
      {
        config,
        pkgs,
        user,
        ...
      }:
      {
        services.samba = {
          # The full package is needed to register mDNS records (for discoverability), see discussion in
          # https://gist.github.com/vy-let/a030c1079f09ecae4135aebf1e121ea6
          package = pkgs.samba4Full.override {
            enableCephFS = false;
          };
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

        # To be discoverable with windows
        services.samba-wsdd = {
          enable = true;
          openFirewall = true;
        };

        # Make sure your user is in the samba group
        users.users.${user.userName} = {
          extraGroups = [ "samba" ];
        };
      };
  };
}
