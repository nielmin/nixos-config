{
  flake.modules.nixos.core = {
    nixpkgs.config = {
      allowUnfree = true;
    };

    programs.nh = {
      enable = true;

      clean = {
        enable = true;

        dates = "05:00";
        extraArgs = "--keep 5 --keep-since 7d";
      };
    };

    nix = {
      settings = {
        trusted-users = [
          "root"
          "daniel"
          "@wheel"
        ];

        experimental-features = "nix-command flakes";

        max-jobs = "auto";

        # Make legacy nix commands use the XDG base directories instead of creating directories in $HOME.
        use-xdg-base-directories = true;

        # The maximum number of parallel TCP connections used to fetch files from binary caches and by other downloads.
        http-connections = 128;

        # This option defines the maximum number of substitution jobs that Nix will try to run in
        # parallet. The default is 16. The minimum value one can choose is 1 and lower values will be
        # interpreted as 1.
        max-substitution-jobs = 128;

        # The number of linse of the tail  of the log to show if a build fails.
        log-lines = 25;

        # When free disk space in /nix/store drops below min-free during a build, Nix performs a
        # garbage-collection until max-free bytes are available or there is no more garbage.
        # A value of 0 (the default) disables this feature.
        min-free = 128000000;
        max-free = 1000000000;

        # Prevent garbage collection from altering nix-shells managed by nix-direnv
        # https://github.com/nix-community/nix-direnv#installation
        keep-outputs = true;
        keep-derivations = true;

        # Automatically detect files in the store that have identical contents, and replaces
        # them with hard links to a single copy. This saves disk space.
        warn-dirty = false;

        download-buffer-size = 524288000;
      };
    };
  };
}
