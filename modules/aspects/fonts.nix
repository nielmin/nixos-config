{den, ...}: {
  den.aspects.fonts = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        agave
        nerd-fonts.agave
      ];
    };

    homeManager = {pkgs, ...}: {};
  };
}
