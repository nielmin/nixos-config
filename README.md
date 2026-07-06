# A denful NixOS config

This repo is the single source of truth for all of my Linux systems, including laptops, desktops, servers, and VMs.

## Nix

My configuration uses the [den](https://github.com/denful/den) framework.
After rewriting my config multiple times without it, I've come to really like the simplicity and flexibility **den** provides.

## Status

[main](https://github.com/nielmin/nixos-config/tree/main) is now using den.
I did not know how to merge probably since den-config branch was of a different history so I just reset main on the branch.
Old [flake-parts](https://flake.parts/) [config](https://github.com/nielmin/nixos-config/tree/flake-parts) is now another branch *just in case*.

## Systems

| Status    | Hostname | Device Type            | Purpose   | Comment              |
|-----------|----------|------------------------|-----------|----------------------|
| Nixxed    | asta     | Laptop                 | General   | Thinkpad T480        |
| Nixxed    | liv      | Laptop                 | General   | ProBook x360 435 G7  |
| Nixxed    | nuc      | Server                 | Octoprint | Intel NUC            |
| TODO      | siv      | Server                 | NAS       | Custom PC            |
| Nixxed    | ines     | Desktop                | General   | Gaming PC            |
