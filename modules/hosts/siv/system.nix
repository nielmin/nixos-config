{
  den,
  nlm,
  __findFile,
  ...
}: {
  den.aspects.siv = {
    includes = [
      <nlm/bootable>
      <nlm/kvm-intel>
      <nlm/services>
    ];
    nixos = {pkgs, ...}: {
      hardware.facter.reportPath = ./facter.json;
      boot = {
        kernelPackages = pkgs.linuxPackages_latest;
        kernelModules = [];
        extraModulePackages = [];
      };
    };
  };
}
