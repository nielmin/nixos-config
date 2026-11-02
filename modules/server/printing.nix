{
  nlm.printing = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        nssmdns
      ];
      services = {
        avahi = {
          enable = true;
          openFirewall = true;
          nssmdns4 = true;
          settings.publish = {
            disable-publishing = false;
            disable-user-service-publishing = false;
            publish-addresses = true;
          };
        };
        printing = {
          enable = true;
          listenAddresses = [ "*:631" ];
          allowFrom = [ "all" ];
          browsing = true;
          defaultShared = true;
          openFirewall = true;
          extraConf = ''
            DefaultEncrytion Never
            DefaultEncryption Never
            DefaultAuthType None

            # Disable authentication requirement for administrative locations
            <Location /admin>
              AuthType None
            </Location>

            <Location /admin/conf>
              AuthType None
            </Location>

            # Disable auth for admin operation requests
            <Policy default>
              <Limit All>
                AuthType None
              </Limit>
            </Policy>
          '';
          drivers = with pkgs; [
            cups-filters
            cups-browsed
            gutenprint
          ];
        };
      };
    };
  };
}
