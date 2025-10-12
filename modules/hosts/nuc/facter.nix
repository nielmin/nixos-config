{
  flake.modules.nixos.host_nuc = {
    facter.reportPath = ./facter.json;
  };
}
