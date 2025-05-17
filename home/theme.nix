{ pkgs, ... }:

{
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-dark";
    size = 24;
  };

  gtk = {
    enable = true;

    cursorTheme = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-dark";
    };

    theme = {
      package = pkgs.rose-pine-gtk-theme;
      name = "Rose-Pine";
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
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

  home.sessionVariables.GTK_THEME = "rose-pine";
}
