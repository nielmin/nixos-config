{nlm, ...}: {
  nlm.browsers = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        chromium
        firefox
        librewolf
      ];

      programs.chromium = {
        enable = true;
        extensions = [
          "cjpalhdlnbpafiamejdnhcphjbkeiagm"
        ];
      };
    };
  };
}
