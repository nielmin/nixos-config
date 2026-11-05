{
  inputs,
  ...
}:
{
  flake.modules.nixos.desktop =
    {
      config,
      lib,
      pkgs,
      ...

    }:
    {
      imports = [
        inputs.self.modules.nixos.kde-desktop
      ];
    };
}
