{
  nlm.utils = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        scrcpy
      ];
    };
  };
}
