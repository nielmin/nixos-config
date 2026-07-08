{nlm, ...}: {
  nlm.gtk = {
    nixos = {pkgs, lib, ...}: let
      theme-name = "Rose Pine";
      theme-package = pkgs.rose-pine-gtk-theme;
      icon-theme-package = pkgs.rose-pine-icon-theme;
      icon-theme-name = "Adwaita";

      gtksettings = ''
        [Settings]
        gtk-icon-theme-name = ${icon-theme-name}
        gtk-theme-name = ${theme-name}
      '';
      in {
        environment = {
          etc = {
            "xdg/gtk-3.0/settings.ini".text = gtksettings;
            "xdg/gtk-4.0/settings.ini".text = gtksettings;
          };
        };
        environment.variables = {
          GTK_THEME = theme-name;
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
          pkgs.gtk
          pkgs.gtk4
        ];
    };
  };
}
