{den, ...}: {
  den.aspects.cli = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
	cryptsetup
	fzf

      	rbw
	pinentry-qt

	unzip
     ];
    };

    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [
        bottom
	neovim
      ];
    };
  };
}
