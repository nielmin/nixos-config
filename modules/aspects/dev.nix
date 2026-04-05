{ den, ... }: {
  den.aspects.dev = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        racket
      ];
    };

    homeManager = { pkgs, ... }: { };
  };
}
