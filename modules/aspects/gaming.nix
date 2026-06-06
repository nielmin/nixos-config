{nlm, ...}: {
  nlm.gaming = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        heroic

        steam-devices-udev-rules
      ];
      programs.steam = {
        enable = true;
      };
    };

    homeManager = {pkgs, ...}: {};
  };
}
