{nlm, __findFile, ...}: {
  nlm.dev = {
    includes = [
      <nlm/fonts>
    ];
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [];

      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
      };
    };

    homeManager = {pkgs, ...}: { };
  };
}
