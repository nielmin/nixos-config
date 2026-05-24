{den, ...}: {
  den.aspects.gaming = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        heroic
     ];
    };

    homeManager = {pkgs, ...}: {};
  };
}
