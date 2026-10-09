{
  inputs,
  self,
  ...
}:
{
  flake.modules.nixos.wezterm =
    {
      pkgs,
      config,
      ...
    }:
    {
      imports = [
        inputs.nix-wrapper-modules.nixosModules.wezterm
      ];

      wrappers.wezterm = {
        enable = true;
        package = pkgs.wezterm;

        "wezterm.lua".content = builtins.readFile ./wezterm.lua;
      };

      environment.systemPackages = [ config.wrappers.wezterm.package ];
    };
}
