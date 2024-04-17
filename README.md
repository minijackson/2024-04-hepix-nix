# 2024-04 HEPiX Nix

Slides and demos of my HEPiX Spring 2024 presentation about Nix/NixOS.

## Demos

They're in the `demos` directory.

You will need Nix to run them.
To install Nix,
follow the [official instructions].

You will also need to [enable the flakes feature].

  [official instructions]: https://nixos.org/download/#nix-install-linux
  [enable the flakes feature]: https://wiki.nixos.org/wiki/Flakes#Other_Distros,_without_Home-Manager

## Build the slides

``` bash
nix develop -c typst compile main.typ main.pdf
```
