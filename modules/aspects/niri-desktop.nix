{ inputs, ... }: {
  flake.modules.nixos.niri-desktop =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    {
      imports = with inputs.self.modules.nixos; [
        browsers
        multimedia
        udev
        fonts
        pipewire
        niri
        stylix
        power-mgmt
        services
        smb
        dev
      ];
      services = {
        displayManager = {
          sessionPackages = lib.mkForce [
            config.wrappers.niri.package
          ];
          noctalia-greeter = {
            enable = true;
            extraArgs = [ "--session niri" ];
          };
        };
      };

      environment.systemPackages = with pkgs; [
        brightnessctl
        stasis
        sunsetr
        wiremix
        xwayland-satellite

        config.wrappers.fuzzel.package
      ];

      programs = {
        niri = {
          enable = true;
          package = config.wrappers.niri.package;
        };

        noctalia = {
          enable = true;
          systemd.enable = true;
          recommendedServices.enable = true;
        };
      };
    };

  flake.modules.homeManager.niri-desktop = {
    xdg.configFile = {
      "noctalia/config.toml".source = ./config.toml;
    };
  };
}
