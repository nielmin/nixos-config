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
      <nlm/noctalia-shell>
    ];
    nixos = {pkgs, config, lib, ...}: {
      imports = [
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
        brightnessctl
        sunsetr

        thunderbird
        supersonic
        xwayland-satellite

        config.wrappers.fuzzel.package
      ];

      programs = {
        niri = {
          enable = true;
          package = config.wrappers.niri.package;
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
