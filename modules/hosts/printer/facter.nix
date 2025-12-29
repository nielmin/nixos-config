{
  flake.modules.nixos.host_printer = {
    facter.reportPath = ./facter.json;
  };
}
