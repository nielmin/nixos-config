{
  nlm,
  __findFile,
  ...
}: {
  nlm.security = {
    includes = [
      <nlm/sops>
    ];

    nixos = {
      security = {
        sudo = {
          enable = true;
          wheelNeedsPassword = false;
        };
      };
    };
  };
}
