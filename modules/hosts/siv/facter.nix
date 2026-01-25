{
  flake.modules.nixos.host_siv = {
    facter.reportPath = ./facter.json;
  };
}
