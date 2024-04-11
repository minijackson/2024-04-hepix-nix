{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixos-generators,
  }: {
    nixosModules.hepix-system = [
        ./configuration.nix
    ];

    nixosConfigurations.hepix-system = nixpkgs.lib.nixosSystem {
      modules = self.nixosModules.hepix-system;
    };

    packages.x86_64-linux = {

      vm-nogui = nixos-generators.nixosGenerate {
        modules = self.nixosModules.hepix-system;
        system = "x86_64-linux";
        format = "vm-nogui";
      };

      # podman import $file hepix-system
      # podman run --rm -it --privileged hepix-system /init
      docker = nixos-generators.nixosGenerate {
        modules = self.nixosModules.hepix-system;
        system = "x86_64-linux";
        format = "docker";
      };

      proxmox = nixos-generators.nixosGenerate {
        modules = self.nixosModules.hepix-system;
        system = "x86_64-linux";
        format = "proxmox";
      };

      proxmox-lxc = nixos-generators.nixosGenerate {
        modules = self.nixosModules.hepix-system;
        system = "x86_64-linux";
        format = "proxmox-lxc";
      };

    };
  };
}
