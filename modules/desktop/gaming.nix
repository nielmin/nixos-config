{
  nlm.gaming = {
    nixos = { pkgs, ... }: {
      imports = [
        ./../../packages/evdev-keepalive.nix
      ];
      environment.systemPackages = with pkgs; [
        # heroic

        steam-devices-udev-rules
      ];
      programs.steam = {
        enable = true;
      };
    };

    homeManager = { ... }: { };
  };
}
