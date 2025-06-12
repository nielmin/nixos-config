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
          ;; Comments are prefixed by double-semicolon. A single semicolon is parsed as the
          ;; keyboard key. Comments are ignored for the configuration file.
          ;;
          ;; This configuration language is Lisp-like. If you're unfamiliar with Lisp,
          ;; don't be alarmed. The maintainer jtroo is also unfamiliar with Lisp. You
          ;; don't need to know Lisp in-depth to be able to configure kanata.
          ;;
          ;; If you follow along with the examples, you should be fine. Kanata should
          ;; also hopefully have helpful error messages in case something goes wrong.
          ;; If you need help, you are welcome to ask.

          ;; Only one defsrc is allowed.
          ;;
          ;; defsrc defines the keys that will be intercepted by kanata. The order of the
          ;; keys matches with deflayer declarations and all deflayer declarations must
          ;; have the same number of keys as defsrc. Any keys not listed in defsrc will
          ;; be passed straight to the operating system.
          (defsrc
           grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
           tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
           caps a    s    d    f    g    h    j    k    l    ;    '    ret
           lsft z    x    c    v    b    n    m    ,    .    /    rsft
           lctl lmet lalt           spc            ralt rmet rctl
          )

          ;; The first layer defined is the layer that will be active by default when
          ;; kanata starts up. This layer is the standard QWERTY layout except for the
          ;; backtick/grave key (@grl) which is an alias for a tap-hold key.
          (deflayer qwerty
           @gph 1    2    3    4    5    6    7    8    9    0    -    =    bspc
           tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
           caps a    s    d    f    g    h    j    k    l    ;    '    ret
           lsft z    x    c    v    b    n    m    ,    .    /    rsft
           lctl lmet lalt           spc            ralt rmet rctl
          )

          ;; The dvorak layer remaps the keys to the dvorak layout. In addition there is
          ;; another tap-hold key: @cap. This key retains caps lock functionality when
          ;; quickly tapped but is read as left-control when held.
          (deflayer graphite
           @qwr 1    2    3    4    5    6    7    8    9    0    [    ]    bspc
           tab  b    l    d    w    z    -    f    o    u    j    ;    =    \
           @cap n    r    t    s    g    y    h    a    e    i    /    ret
           lsft q    x    m    c    v    k    p    .    '    ,    rsft
           lctl lmet lalt           spc            ralt rmet rctl
          )

          (defalias

           gph (tap-hold 200 200 grv (layer-switch graphite))

           ;; tap for capslk, hold for lctl
           cap (tap-hold 200 200 caps lctl)
          )
          '';
      };
    };
  };
}
