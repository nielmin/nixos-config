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
      wrappedWezterm = inputs.nix-wrapper-modules.wrappers.wezterm.wrap {
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
