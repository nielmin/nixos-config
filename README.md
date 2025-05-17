# My NixOS Setup

## Status

A work in progress.

Based off of [ryan4yin/i3-kickstarter](https://github.com/ryan4yin/nix-config/tree/i3-kickstarter) and his wonderful [NixOS & Flakes Book](https://nixos-and-flakes.thiscute.world/).

## Configuration Structure

- `home` and `users` are for home-manager.
    - 'users' is where home-manager 'home.nix' resides.
- 'modules' is for for NixOS and system packages.
- 'hosts' is for for all systems w/ NixOS installed.
    - 'hosts' also imports 'modules'.

## TODO
- [ ] Replicate existing dotfiles.
    - [ ] Setup neovim.
    - [ ] Setup emacs.
    - [X] Setup tmux.
    - [ ] Setup fish/bash/zsh.
- [X] Setup GNOME to my liking.
- [ ] Setup a tiling window manager.
    - Got annoyed setting up waybar on Hyprland. Will try again later.
- [ ] Add another home-manager config for non-NixOS Linux.
    - [ ] Something to do with NixGL overlay.
- [X] Add another NixOS host.
