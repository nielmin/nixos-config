{den, ...}: {
  # user aspect
  den.aspects.daniel = {
    includes = [
      den.provides.define-user
      den.provides.primary-user
      (den.provides.user-shell "fish")
      den.aspects.media
      den.aspects.services
      den.aspects.security
    ];

    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [
        bottom
        neovim
      ];
    };

    # user can provide NixOS configurations
    # to any host it is included on
    # nixos = { pkgs, ... }: { };
  };
}
