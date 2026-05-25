{den, ...}: {
  den.aspects.cli = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
      	rbw
	pinentry-qt

	cryptsetup
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
