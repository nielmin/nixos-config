{
  inputs,
  lib,
  ...
}: {
  nlm.wezterm = {
    nixos = {
      pkgs,
      wrappers,
      ...
    }: let
      wrappedWezterm = inputs.wrappers.wrappers.wezterm.wrap {
        inherit pkgs;
        "wezterm.lua".path = ./wezterm/wezterm.lua;
      };
    in {
      environment.systemPackages = [
        wrappedWezterm
      ];
    };
  };
}
