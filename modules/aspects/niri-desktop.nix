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
      <nlm/cifs>
      <nlm/fonts>
      <nlm/pipewire>
      <nlm/wezterm>
      <nlm/niri>
      <nlm/gtk>
    ];
    nixos = {
      pkgs,
      config,
      lib,
      ...
    }: {
      imports = [
        inputs.noctalia.nixosModules.default
        inputs.noctalia-greeter.nixosModules.default
      ];

      services = {
        power-profiles-daemon.enable = false;

        tlp = {
          enable = true;
          pd.enable = true;
        };

        displayManager.sessionPackages = lib.mkForce [
          config.wrappers.niri.package
        ];
      };

      environment.systemPackages = with pkgs; [
        brightnessctl
        nwg-look
        sunsetr
        xwayland-satellite

        thunderbird
        supersonic

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

        localsend = {
          enable = true;
          openFirewall = true;
        };
      };
    };

    hjem = {pkgs, ...}: {
      files = {
        ".config/noctalia/config.toml".source = ./config.toml;
      };
    };
  };
}
