{...}: {
  nlm.cad = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        freecad
        kicad
        openscad-unstable
        orca-slicer
      ];
    };
  };
}
