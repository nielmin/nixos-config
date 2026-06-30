{ inputs, nlm, ... }:
{
  flake-file.inputs.sops-nix = {
    url = "github:Mic92/sops-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

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
            sopsFile = ../../secrets/samba.yaml;
            key = "samba_password";
            owner = "root";
            group = "root";
            mode = "0400";
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
