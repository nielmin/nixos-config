{...}: {
  systems = ["x86_64-linux"];
  perSystem = {pkgs, ...}: {
    devShells.default = pkgs.mkShell {
      packages = with pkgs; [
        nixfmt-rs
        nh
        lua-language-server
        stylua
      ];
    };

    formatter = pkgs.nixfmt-rs;
  };
}
