{
  nlm,
  __findFile,
  ...
}: {
  nlm.cad = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        freecad
        # openscad-unstable
        orca-slicer
      ];
    };
  };
}
