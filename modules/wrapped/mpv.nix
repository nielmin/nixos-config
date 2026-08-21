{inputs, ...}: {
  nlm.mpv = {
    nixos = {
      config,
      pkgs,
      ...
    }: {
      imports = [
        inputs.nix-wrapper-modules.nixosModules.mpv
      ];

      wrappers.mpv = {
        enable = true;
        package = pkgs.mpv;
        "mpv.conf".content = ''
          vo=gpu
          hwdec=auto
          keep-open=yes
          geometry=50%:50%
          autofit-larger=70%x70%
          save-position-on-quit
          volume=50
          volume-max=100
        '';
      };
      environment.systemPackages = [config.wrappers.mpv.package];
    };
  };
}
