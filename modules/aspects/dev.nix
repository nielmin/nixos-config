{
  nlm,
  __findFile,
  ...
}: {
  nlm.dev = {
    includes = [
      <nlm/fonts>
      <nlm/neovim>
    ];
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [];

      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
      };
    };

    homeManager = {pkgs, ...}: {};
  };
}
