{
  self,
  lib,
  ...
}:
let
  username = "daniel";
in
{
  flake.homeConfigurations = lib.mkHomeManager { username = "${username}"; };

  flake.modules = lib.mkMerge [
    (self.factory.user "${username}")
    {
      homeManager."${username}" = {
        imports = with self.modules.homeManager; [
          system
          alacritty
        ];
      };
    }
  ];
}
