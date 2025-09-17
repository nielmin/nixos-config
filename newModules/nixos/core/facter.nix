{
  flake.modules.nixos.facter =
  { inputs, ... }:

  {
    imports = [
      inputs.nixos-facter-modules.nixosModules.fatcter 
    ];  
  };
}
