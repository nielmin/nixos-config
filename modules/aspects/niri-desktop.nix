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
      <nlm/power-mgmt>
      <nlm/services>
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
      };
    };

    hjem = {pkgs, ...}: {
      files = {
        ".config/noctalia/config.toml".source = ./config.toml;
      };
    };
  };
}
