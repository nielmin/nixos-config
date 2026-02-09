{ self, ... }:
{
  flake.modules.nixos.vm = {
    imports = with self.modules.nixos; with self.factory; [ daniel ];
  };
}
