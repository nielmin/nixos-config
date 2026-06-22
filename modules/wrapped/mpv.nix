{inputs, ...}: {
  nlm.mpv = {
    nixos = {
      pkgs,
      wrappers,
      ...
    }: let
      wrappedMpv = inputs.nix-wrapper-modules.wrappers.mpv.wrap {
        inherit pkgs;

        "mpv.conf".content = ''
          vo=gpu
          hwdec=auto
          keep-open=yes
          geometry=50%:50%
          autofit-larger=70%x70%
          save-position-on-quit
        '';
      };
    in {
      environment.systemPackages = [
        wrappedMpv
      ];
    };
  };
}
