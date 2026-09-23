{
  nlm.virtualisation = {
    nixos = {pkgs, ...}: {
      virtualisation = {
        incus = {
          enable = true;
          ui.enable = true;
        };

        podman = {
          enable = true;
          dockerCompat = true;
          defaultNetwork.settings = {dns_enabled = true;};
        };
      };

      networking.firewall.trustedInterfaces = ["incusbr0"];
    };
  };
}
