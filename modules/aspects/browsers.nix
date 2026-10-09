{
  flake.modules.nixos.browsers = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      chromium
    ];

    programs.firefox = {
      enable = true;
      package = pkgs.librewolf;
    };

    programs.chromium = {
      enable = true;
      extensions = [
        "cjpalhdlnbpafiamejdnhcphjbkeiagm"
      ];
    };
  };

  flake.modules.homeManager.browsers = {
    programs.firefox = {
      enable = true;
      profiles."my-profile" = {
        id = 0;
        isDefault = true;
      };
    };
  };
}
