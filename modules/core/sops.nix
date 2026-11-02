{ inputs, ... }: {
  nlm.sops = {
    nixos = { pkgs, ... }: {
      imports = [
        inputs.sops-nix.nixosModules.sops
      ];

      sops = {
        defaultSopsFile = ../../.sops.yaml;
        age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

        secrets = {
          "samba" = {
            sopsFile = ../../secrets/secrets.yaml;
            key = "samba";
            owner = "root";
          };
          "userPass" = {
            sopsFile = ../../secrets/secrets.yaml;
            key = "userPass";
          };
          "nucPass" = {
            sopsFile = ../../secrets/secrets.yaml;
            key = "nucPass";
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
