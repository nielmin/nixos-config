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
    - [X] Setup neovim.
    - [ ] Setup emacs.
    - [X] Setup tmux.
    - [ ] Setup fish/bash/zsh.
        - [X] bash.
        - [ ] zsh.
        - [ ] fish.
- [X] Setup GNOME to my liking.
- [ ] Setup a tiling window manager.
    - [?] Sway
        - Much easier to setup but theming is not working.
    - [?] Hyprland
        - Basic things are working.
        - Kanshi does not work.
- [ ] Add another home-manager config for non-NixOS Linux.
    - [ ] Something to do with NixGL overlay.
- [X] Add another NixOS host.

## Learning Resources

Mostly blog posts about using things on NixOS.

### Dotfiles

- [Moving My Dotfiles to Nix](https://evantravers.com/articles/2023/11/28/moving-my-dotfiles-to-nix/)
- [Managing dotfiles with Nix](https://seroperson.me/2024/01/16/managing-dotfiles-with-nix/)

#### GNOME

- [Declaritive GNOME configuration with NixOS](https://hoverbear.org/blog/declarative-gnome-configuration-in-nixos/)

### Neovim

- [Lazy.nvim on NixOS](https://nixalted.com/)
- [Managing mutable files in NixOS](https://www.foodogsquared.one/posts/2023-03-24-managing-mutable-files-in-nixos/)
- [Neovim Treesitter Grammars with Nix and lazy.nvim](https://breuer.dev/blog/treesitter-grammars-nix)
- [Neovim with Nix and lazy.nvim](https://breuer.dev/blog/nix-lazy-neovim)
- [Setup LazyVim using Nix and home-manager](https://github.com/LazyVim/LazyVim/discussions/1972)
