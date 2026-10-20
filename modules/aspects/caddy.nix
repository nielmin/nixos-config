{
  nlm.caddy = {
    nixos = { config, pkgs, ... }: {
      sops.secrets = {
        "cf_api_token" = {
          sopsFile = ../../secrets/secrets.yaml;
          key = "cf_api_token";
        };
      };

      services.caddy = {
        enable = true;
        package = pkgs.caddy.withPlugins {
          plugins = [ "github.com/caddy-dns/cloudflare@v0.2.4" ];
          hash = "sha256-xRJ5evsAJ2akg47j3Bt6YDXJOgX88B/rKNP50KSVyNY=";
        };
        virtualHosts."*.kimo.boo".extraConfig = ''
          tls {
            dns cloudflare {env.CF_API_TOKEN}
            resolvers 1.1.1.1 8.8.8.8
          }


          @home host home.kimo.boo
          handle @home {
            reverse_proxy http://10.210.187.105:80
          }

          @second host second.kimo.boo
          handle @second {
            reverse_proxy http://10.210.187.205:80
          }

          handle {
            respond "Service not found on this wildcard route." 404
          }
        '';
      };

      systemd.services.caddy.serviceConfig = {
        Environment = [
          "CF_API_TOKEN=${config.sops.secrets.cf_api_token}"
        ];
      };

      networking.firewall.allowedTCPPorts = [
        80
        443
      ];
    };
  };
}
