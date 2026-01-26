{
  flake.modules.nixos.host_vm = {
    preservation = {
      enable = true;
      preserveAt."/persist" = {
        directories = [
          "/var/lib/systemd/timers"
          # NixOS user state
          "/var/lib/nixos"
          "/var/log"
        ];
        files = [
          { file = "/etc/machine-id"; inInitrd = true; }
          { file = "/etc/ssh/ssh_host_rsa_key"; how = "symlink"; configureParent = true; }
          { file = "/etc/ssh/ssh_host_ed25519_key"; how = "symlink"; configureParent = true; }
        ];
        users.daniel = {
          directories = [
            "Documents"
            "Downloads"
            "Music"
            "Pictures"
            "Videos"
            "tmp"
          ];
        };
      };
    };

    # systemd-machine-id-commit.service would fail, but it is not relevant
    # in this specific setup for a persistent machine-id so we disable it
    #
    # see the firstboot example below for an alternative approach
    systemd.suppressedSystemUnits = [ "systemd-machine-id-commit.service" ];
  };
}
