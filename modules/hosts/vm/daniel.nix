{ self, ... }:
{
  flake.modules.nixos.daniel = {
    imports = with self.modules.nixos; with self.factory.user; [ daniel ];
  };
}
