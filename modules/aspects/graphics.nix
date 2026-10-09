{
  flake.modules.nixos.graphics = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      inkscape
    ];
  };
}
