{
  flake.modules.homeManager.dev =
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
