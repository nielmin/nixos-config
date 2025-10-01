{
  flake.modules.homeManager.undervolt =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        undervolt
        s-tui
        stress
      ];
    };
}
