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
      <nlm/wezterm>
      <nlm/niri>
    ];
    nixos = {pkgs, config, lib, ...}: {
      imports = [
        inputs.noctalia.nixosModules.default
        inputs.noctalia-greeter.nixosModules.default
      ];

      services = {
        printing.enable = true;
        geoclue2.enable = true;

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
        adwaita-icon-theme
        brightnessctl
        nwg-look
        sunsetr
        xwayland-satellite
        rose-pine-cursor

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
  };
}
