{
  self,
  lib,
  ...
}:
{
  flake.modules = lib.mkMerge [
    (self.factory.user "daniel" true)
    {
      nixos.bob = {
        imports = with self.modules.nixos; [
          # developmentEnvironment
        ];
        users.users.daniel = {
          group = "audio";
        };
      };

      darwin.daniel = {
        imports = with self.modules.darwin; [
          # drawingApps
          # developmentEnvironment
        ];
      };

      homeManager.daniel =
        { pkgs, ... }:
        {
          imports = with self.modules.homeManager; [
            system-desktop
            # adminTools
            # vscode
            # passwordManager
          ];
          home.packages = with pkgs; [
            mediainfo
          ];
        };
    }
  ];
}
