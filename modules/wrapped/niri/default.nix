{
  nlm,
  inputs,
  ...
}: {
  nlm.niri = {
    nixos = {
      pkgs,
      lib,
      config,
      ...
    }: {
      imports = [
        inputs.nix-wrapper-modules.nixosModules.niri
      ];

      wrappers.niri = {
        enable = true;
        "config.kdl".path = ./config.kdl;

        drv.postBuild = ''
          mkdir -p $out/share/wayland-sessions
          rm -f $out/share/wayland-sessions/niri.desktop
          cp -f ${pkgs.niri}/share/wayland-sessions/niri.desktop $out/share/wayland-sessions/
        '';
      };
    };

    homeManager = {pkgs, ...}: {};
  };
}
