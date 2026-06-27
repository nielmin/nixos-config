{nlm, ...}: {
  nlm.udev = {
    nixos = {pkgs, ...}: {
      services.udev = {
        enable = true;
        extraRules = ''
          # MACROSILICON WARRKY USB 3.0
          KERNEL=="hidraw*", ATTRS{idVendor}=="345f", ATTRS{idProduct}=="2130", MODE="0666"

          # Compx NK mouse NANO dongle
          KERNEL=="hidraw*", ATTRS{idVendor}=="373b", ATTRS{idProduct}=="10c9", MODE="0666"

          # Compx VXE R1 NK
          KERNEL=="hidraw*", ATTRS{idVendor}=="373b", ATTRS{idProduct}=="10c7", MODE="0666"

          # 44.1 KHz with Mic
          KERNEL=="hidraw*", ATTRS{idVendor}=="0a12", ATTRS{idProduct}=="4126", MODE="0666"

          # 48 KHz with Mic
          KERNEL=="hidraw*", ATTRS{idVendor}=="0a12", ATTRS{idProduct}=="4125", MODE="0666"

          # 44.1/48/88.2/96 KHz
          KERNEL=="hidraw*", ATTRS{idVendor}=="0a12", ATTRS{idProduct}=="4007", MODE="0666"

          # 44.1 KHz
          KERNEL=="hidraw*", ATTRS{idVendor}=="0a12", ATTRS{idProduct}=="4006", MODE="0666"

          # 48 KHz
          KERNEL=="hidraw*", ATTRS{idVendor}=="0a12", ATTRS{idProduct}=="4005", MODE="0666"

          # 88.2 KHz
          KERNEL=="hidraw*", ATTRS{idVendor}=="0a12", ATTRS{idProduct}=="4004", MODE="0666"

          # 96 KHz
          KERNEL=="hidraw*", ATTRS{idVendor}=="0a12", ATTRS{idProduct}=="4003", MODE="0666"
        '';
      };
    };
  };
}
