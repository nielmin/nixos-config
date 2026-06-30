{nlm, __findFile, ...}: {
  nlm.security = {
    includes = [
      <nlm/sops>
    ];

    nixos = {pkgs, ...}: {
      security = {
        sudo = {
          enable = true;
          wheelNeedsPassword = false;
        };
      };
    };
  };
}
