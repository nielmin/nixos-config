{inputs, lib, ...}: {
  nlm.wezterm = {
    nixos = {pkgs, wrappers, ...}:
    let
      wrappedWezterm = inputs.wrappers.wrappers.wezterm.wrap {
        inherit pkgs;
        
        "wezterm.lua".path = ./wezterm;
      };
    in {
      environment.systemPackages = [
        wrappedWezterm
      ];
    };
  };
}
