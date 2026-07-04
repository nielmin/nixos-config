{
  nlm,
  ...
}: {
  nlm.browsers = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        chromium
        firefox
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
