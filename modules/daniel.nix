{ den, ... }:
{
  # user aspect
  den.aspects.daniel = {
    includes = [
      den.provides.primary-user
      (den.provides.user-shell "fish")
    ];

    homeManager = { pkgs, ... }: {
      services = {
        syncthing.enable = true;
      };

      home.packages = with pkgs; [
        bottom
        neovim
      ];

      programs = {
        mpv.enable = true;
      };
    };

    # user can provide NixOS configurations
    # to any host it is included on
    # nixos = { pkgs, ... }: { };
  };
}
