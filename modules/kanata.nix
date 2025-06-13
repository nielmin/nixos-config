{ config,
  lib,
  username,
  ...
}:

{
# Enable the uinput module
  boot.kernelModules = [ "uinput" ];

# Enable uinput
  hardware.uinput.enable = true;

# Set up udev rules for uinput
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
    '';

# Ensure the uinput group exists
  users.groups.uinput = { };

# Add the Kanata service user to necessary groups
  systemd.services.kanata-internalKeyboard.serviceConfig = {
    SupplementaryGroups = [
      "input"
        "uinput"
    ];
  };

  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
# Replace the paths below with the appropriate device paths for your setup.
# Use `ls /dev/input/by-path/` to find your keyboard devices.
          "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
        ];
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
          (defsrc
           grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
           tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
           caps a    s    d    f    g    h    j    k    l    ;    '    ret
           lsft z    x    c    v    b    n    m    ,    .    /    rsft
           lctl lmet lalt           spc            ralt rmet rctl
          )

          (deflayer qwerty
           @gph 1    2    3    4    5    6    7    8    9    0    -    =    bspc
           tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
           caps a    s    d    f    g    h    j    k    l    ;    '    ret
           lsft z    x    c    v    b    n    m    ,    .    /    rsft
           lctl lmet lalt           spc            ralt rmet rctl
          )

          (deflayer graphite
           @qwr 1    2    3    4    5    6    7    8    9    0    [    ]    bspc
           tab  b    l    d    w    z    -    f    o    u    j    ;    =    \
           @cap n    r    t    s    g    y    h    a    e    i    /    ret
           lsft q    x    m    c    v    k    p    .    '    ,    rsft
           lctl lmet lalt           spc            ralt rmet rctl
          )

          (defalias

           gph (tap-hold 200 200 grv (layer-switch graphite))
           qwr (tap-hold 200 200 grv (layer-switch graphite))

           ;; tap for capslk, hold for lctl
           cap (tap-hold 200 200 caps lctl)
          )
          '';
      };
    };
  };
}
