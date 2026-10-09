{
  flake.modules.nixos.virtualisation = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      gvproxy
      qemu
      quickemu
    ];

    virtualisation = {
      incus = {
        enable = true;
        ui.enable = true;
      };

      podman = {
        enable = true;
        dockerCompat = true;
        defaultNetwork.settings = {
          dns_enabled = true;
        };
      };
    };

    networking.firewall.trustedInterfaces = [ "incusbr0" ];
  };
}
