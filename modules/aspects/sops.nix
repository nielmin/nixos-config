{ inputs, ... }: {
  nlm.sops = {
    nixos = { pkgs, ... }: {
      imports = [
        inputs.sops-nix.nixosModules.sops
      ];

      sops = {
        defaultSopsFile = ../../secrets/secrets.yaml;
        age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

        secrets = {
          "samba" = {
            key = "samba";
            owner = "root";
          };
          "users/daniel" = {
            key = "users/daniel";
          };
          "users/nuc" = {
            key = "users/nuc";
          };
        };
      };

      environment.systemPackages = with pkgs; [
        sops
        age
        ssh-to-age
        ssh-to-pgp
      ];
    };
  };
}
