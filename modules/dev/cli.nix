{
  flake.modules.homeManager.cli =
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
