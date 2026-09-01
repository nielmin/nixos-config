{
  inputs,
  nlm,
  __findFile,
  ...
}: {
  nlm.niri-desktop = {
    includes = [
      <nlm/browsers>
      <nlm/multimedia>
      <nlm/udev>
      <nlm/fonts>
      <nlm/pipewire>
      <nlm/niri>
      <nlm/stylix>
      <nlm/power-mgmt>
      <nlm/services>
      <nlm/smb>
      <nlm/dev>
    ];
    nixos = {
      pkgs,
      config,
      lib,
      ...
    }: {
      services = {
        displayManager.sessionPackages = lib.mkForce [
          config.wrappers.niri.package
        ];
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

        noctalia-greeter = {
          enable = true;
          greeter-args = "--session niri";
        };
      };
    };

    homeManager = {...}: {
      xdg.configFile = {
        "noctalia/config.toml".source = ./config.toml;
      };
    };
  };
}
