{den, ...}: {
  den.aspects.gaming = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        heroic
      ];
      programs.steam = {
        enable = true;
      };
    };

    homeManager = {pkgs, ...}: {};
  };
}
