{
  inputs,
  ...
}:

{
  flake.modules.nixos.core =
    {
      config,
      lib,
      pkgs,
      ...

    }:
    {
      imports = [
        inputs.self.modules.nixos.bootloader
        inputs.self.modules.nixos.fwupd
        inputs.self.modules.nixos.localization
        inputs.self.modules.nixos.settings
        inputs.self.modules.nixos.networking
        inputs.self.modules.nixos.ssh
      ];

      config = {
        bootloader.enable = lib.mkDefault true;
        fwupd.enable = lib.mkDefault true;
        localization.enable = lib.mkDefault true;
        nix-settings.enable = lib.mkDefault true;
        ssh.enable = lib.mkDefault true;

        environment.systemPackages = with pkgs; [
          git
          neovim
          wget
        ];
      };
    };
}
