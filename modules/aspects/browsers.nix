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

    homeManager = {pkgs, ...}: {
      programs.firefox = {
        enable = true;
        profiles."my-profile" = {
          id = 0;
        };
      };
    };
  };
}
