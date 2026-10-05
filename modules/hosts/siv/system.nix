{
  den,
  inputs,
  nlm,
  __findFile,
  ...
}:
{
  den.aspects.siv = {
    includes = [
      <nlm/bootable>
      <nlm/kvm-intel>
      <nlm/services>
      <nlm/smb>
      <nlm/smb-server>
    ];
    nixos = { pkgs, ... }: {
      imports = [
        inputs.disko.nixosModules.disko
        ./_disko.nix
      ];

      hardware.facter.reportPath = ./facter.json;

      sops = {
        secrets = {
          "private_keys/daniel_siv" = {
            sopsFile = ../../../secrets/secrets.yaml;
            path = "/etc/ssh/ssh_host_ed25519_key";
            mode = "0600";
          };
        };
      };

      boot = {
        kernelPackages = pkgs.linuxPackages;
        kernelModules = [ ];
        extraModulePackages = [ ];
        supportedFilesystems = {
          btrfs = true;
          zfs = true;
        };
        zfs = {
          forceImportRoot = false;
          extraPools = [
            "epool"
            "kpool"
          ];
        };
      };

      networking.hostId = "aba04682";

      services.zfs.autoScrub.enable = true;
    };
  };
}
