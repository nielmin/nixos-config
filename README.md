# A dendritic, flake-parts NixOS config

## Motivation for rewrite

There came a point while using the [den](https://github.com/denful/den) framework that I didn't really need all the features the framework professes.
Using a framework also hindered my ability to understand NixOS at its core due to the inherrent abstraction layer.
If I plan to use NixOS as my forever OS, then it makes sense that I should start learning the fundamentals.
So I settled for a good middle ground using [flake-parts](https://flake.parts/).

I referenced [Robbie Jennings' nix-config](https://github.com/RobbieJennings/nix-config) since I liked the base layout and organization.
Even though the dendritic pattern is supposed to make your configuration more modular, due to it being a pattern there is a lot of variance among other people's configuration.

## Status

The rewrite is a WIP.
It's not difficult by any means, but it is tedious.

## Systems

| Status    | Hostname | Device Type  | Purpose   | Model                | Comment |
|-----------|----------|--------------|-----------|----------------------|---------|
| Nixxed    | asta     | Laptop       | General   | Thinkpad T480        | SOLD    |
| Nixxed    | liv      | Laptop       | General   | ProBook x360 435 G7  |         |
| Nixxed    | nuc      | Server       | Octoprint | Intel NUC            |         |
| Nixxed    | siv      | Server       | NAS       | Custom PC            |         |
| Nixxed    | ines     | Desktop      | General   | Gaming PC            |         |
