{den, ...}: {
  den.aspects.media = {
    nixos = {pkgs, ...}: {};
    homeManager = {pkgs, ...}: {
      programs.mpv = {
        enable = true;
      };
    };
  };
}
