{
  flake.modules.nixos.system = {
    imports = with self.modules.nixos; [
      nix
      home-manager
      state
    ];
  };

  flake.modules.homeManager.system = {
    imports = with self.modules.homeManager; [
      nix
      home-manager
      state
    ];
  };
}
