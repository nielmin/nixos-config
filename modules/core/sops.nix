{ inputs, ... }: {
  flake.modules.nixos.sops = { pkgs, ... }: {

    sops = {
      defaultSopsFile = ../../secrets/secrets.yaml;
      age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    };

    environment.systemPackages = with pkgs; [
      sops
      age
      ssh-to-age
      ssh-to-pgp
    ];
  };
}
