{
  flake.modules.nixos.host_asta = {
    facter.reportPath = ./facter.json;
  };
}
