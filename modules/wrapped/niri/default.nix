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
          # 1. Remove the read-only symlink created by symlinkJoin
          rm -f $out/share/wayland-sessions/niri.desktop

          # 2. Re-create the directory just in case, though it should already exist
          mkdir -p $out/share/wayland-sessions

          # 3. Safely read from the upstream package and write a fresh file into $out
          substitute ${pkgs.niri}/share/wayland-sessions/niri.desktop \
            $out/share/wayland-sessions/niri.desktop \
            --replace-warn "Exec=niri" "Exec=$out/bin/niri"
        '';
      };
    };

    homeManager = {pkgs, ...}: {};
  };
}
