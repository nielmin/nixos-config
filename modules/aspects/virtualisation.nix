{nlm, ...}: {
  nlm.virtualisation = {
    nixos = {pkgs, ...}: {
      virtualisation.incus.enable = true;
      networking.firewall.trustedInterfaces = ["incusbr0"];
    };
  };
}
