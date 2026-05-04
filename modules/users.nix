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
  den.aspects.nuc = {
    includes = [
      den.provides.define-user
      den.provides.primary-user
    ];
    user.hashedPassword = "$6$RkIPlT6IZxqyiuNG$u4ujjJEJe6kk7JHI.QaXSkwVYj8HBLKVm4Lr.I3DIHfyNsJqdWba.qajQRO.BPdq8e9fCoq58ROoexR/3F7hS.";
  };
}
