{den, ...}: {
  den.aspects.cli = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
      	rbw
	pinentry-qt
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
