{
  nlm.btrfs = {
    nixos = {
      services.btrfs.autoScrub = {
        enable = true;
        interval = "weekly";
      };
    };
  };
}
