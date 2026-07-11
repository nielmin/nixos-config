{nlm, ...}: {
  nlm.gtk = let
    theme-name = "rose-pine";
    icon-theme-name = "oomox-rose-pine";

    gtksettings = ''
      [Settings]
      gtk-icon-theme-name=${icon-theme-name}
      gtk-theme-name=${theme-name}
      gtk-application-prefer-dark-theme=true
    '';
  in {
    nixos = {
      pkgs,
      lib,
      ...
    }: let
      theme-package = pkgs.rose-pine-gtk-theme;
      icon-theme-package = pkgs.rose-pine-icon-theme;
    in {
      environment = {
        etc = {
          "xdg/gtk-3.0/settings.ini".text = gtksettings;
          "xdg/gtk-4.0/settings.ini".text = gtksettings;
        };
      };
      environment.variables = {
        GTK_THEME = "${theme-name}";
      };

      programs.dconf = {
        enable = lib.mkDefault true;
        profiles.user.databases = [
          {
            lockAll = false;
            settings = {
              "org/gnome/desktop/interface" = {
                gtk-theme = theme-name;
                icon-theme = icon-theme-name;
                color-scheme = "prefer-dark";
              };
            };
          }
        ];
      };
      environment.systemPackages = [
        theme-package
        icon-theme-package

        pkgs.rose-pine-cursor
        pkgs.gtk3
        pkgs.gtk4
      ];
    };

    hjem = {pkgs, ...}: {
      files = {
        ".config/gtk-3.0/settings.ini".source = pkgs.writeTextFile {
          name = "settings.ini";
          text = gtksettings;
        };
        ".config/gtk-4.0/settings.ini".source = pkgs.writeTextFile {
          name = "settings.ini";
          text = gtksettings;
        };
      };
    };
  };
}
