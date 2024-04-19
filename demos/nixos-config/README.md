# NixOS configuration demo

In this folder you will find `configuration.nix`,
which defines a NixOS system.

To build it you can use the `nixos-rebuild` tool,
which you can make available by running:

```bash
nix shell 'nixpkgs#nixos-rebuild'
```

Here's what you can do with this demo:

```bash
# Build a test VM from that configuration
nixos-rebuild build-vm --flake ".#hepix-system"`
# then run the VM
./result/bin/run-nixos-vm

# Build a VM without graphical interface
nix build ".#vm-nogui"
# and run that VM
./result/bin/run-nixos-vm

# Build a docker image
nix build ".#docker"
# Build a Proxmox VM image
nix build ".#proxmox"
# Build a Proxmox container image
nix build ".#proxmox-lxc"
```
