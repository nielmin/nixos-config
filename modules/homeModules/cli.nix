{
  flake.homeModules.cli =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        ripgrep
        jq
        eza
        fzf
        zoxide
        gnumake
      ];
    };
}
