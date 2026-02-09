{ self, ... }:
{
  flake.modules.nixos.asta = {
    imports = with self.modules.nixos; with self.factory; [ daniel ];
  };
}
