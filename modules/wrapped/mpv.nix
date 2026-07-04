{inputs, ...}: {
  nlm.mpv = {
    nixos = {
      pkgs,
      lib,
      config,
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
        '';
      };
      environment.systemPackages = [config.wrappers.mpv.package];
    };
  };
}
