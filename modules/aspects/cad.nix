{
  flake.modules.nixos.cad = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      freecad
      kicad
      openscad-unstable
      orca-slicer
    ];
  };
}
