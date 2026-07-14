{
  nlm,
  ...
}: {
  nlm.virtualisation = {
    nixos = {pkgs, ...}: {
      virtualisation.incus.enable = true;
      networking.nftables.enable = true;
    };
  };
}
