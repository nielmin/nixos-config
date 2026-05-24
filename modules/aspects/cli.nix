{den, ...}: {
  den.aspects.cli = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
      	rbw
     ];
    };

    homeManager = {pkgs, ...}: {};
  };
}
