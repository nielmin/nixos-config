{den, ...}: {
  den.aspects.dev = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [];

      programs.direnv = {
        enable = true;
      };
    };

    homeManager = {pkgs, ...}: {};
  };
}
