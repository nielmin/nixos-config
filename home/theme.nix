{ pkgs, ... }:

{
  gtk = {
    enable = true;

    cursorTheme = {
      name = "Adwaita";
    };

    theme = {
      name = "Adwaita";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    gtk3.extraConfig = {
      Settings = ''
	gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
	gtk-application-prefer-dark-theme=1
      '';
    };
  };

  home.sessionVariables.GTK_THEME = "Adwaita";
}
