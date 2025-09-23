{
  flake.modules.homeManager.core =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        nitch

        # archives
        zip
        xz
        unzip
        p7zip
        unrar

        # utils
        ripgrep # recursively searches directories for a regex pattern
        jq # A lightweight and flexible command-line JSON processor
        eza # A modern replacement for ‘ls’
        fzf # A command-line fuzzy finder

        # networking tools
        mtr # A network diagnostic tool
        iperf3
        dnsutils  # `dig` + `nslookup`
        ldns # replacement of `dig`, it provide the command `drill`
        aria2 # A lightweight multi-protocol & multi-source command-line download utility
        socat # replacement of openbsd-netcat
        nmap # A utility for network discovery and security auditing
        ipcalc  # it is a calculator for the IPv4/v6 addresses

        # misc
        cowsay
        file
        which
        tree
        gnused
        gnutar
        gawk
        zstd
        gnupg

        iotop # io monitoring
        iftop # network monitoring

        # system call monitoring
        strace # system call monitoring
        ltrace # library call monitoring
        lsof # list open files

        # system tools
        sysstat
        lm_sensors # for `sensors` command
        ethtool
        pciutils # lspci
        usbutils # lsusb

        gnumake

        zoxide
        eza
        bat 
      ];
    };
}
