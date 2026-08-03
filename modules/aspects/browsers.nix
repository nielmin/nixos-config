{nlm, ...}: {
  nlm.browsers = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        chromium
        librewolf
      ];

      programs.firefox = {
        enable = true;
      };

      programs.chromium = {
        enable = true;
        extensions = [
          "cjpalhdlnbpafiamejdnhcphjbkeiagm"
        ];
      };
    };
  };
}
