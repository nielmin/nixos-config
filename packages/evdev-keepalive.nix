{ config, pkgs, ... }:

let
  evdev-keepalive = pkgs.stdenv.mkDerivation {
    pname = "evdev-keepalive";
    version = "unstable-2024";

    src = pkgs.fetchFromGitHub {
      owner = "pastaq";
      repo = "evdev-keepalive";
      rev = "master";
      hash = "sha256-3rQxOwkHLJ1Wz5LJkU6p39GXyLz3fyH1zYXoeM8e6lI=";
    };

    nativeBuildInputs = [ pkgs.gcc ];

    buildPhase = ''
      gcc evdev_keepalive.c -o evdev_keepalive
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp evdev_keepalive $out/bin/
    '';
  };
in
{
  environment.systemPackages = [ evdev-keepalive ];

  systemd.services."evdev-keepalive@" = {
    description = "Keep 8BitDo controller alive on %I";
    unitConfig = {
      StopWhenUnneeded = true;
    };
    serviceConfig = {
      Type = "simple";
      ExecStart = "${evdev-keepalive}/bin/evdev_keepalive %I";
      Restart = "on-failure";
      RestartSec = "2s";
    };
  };

  services.udev.extraRules = ''
    ### 8BitDo Pro 3 (2.4GHz mode) ###
    ACTION=="add", SUBSYSTEM=="input", KERNEL=="event*", ATTRS{idVendor}=="2dc8", ATTRS{idProduct}=="310b", TAG+="systemd", ENV{SYSTEMD_WANTS}+="evdev-keepalive@$kernel.service"
  '';
}
