{
  description = "flake for jackOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }@inputs: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./hardware/proxmox-desktop.nix
        ./modules/desktop.nix
        ./modules/gaming.nix
        ./modules/gpu-passthrough.nix
        ./modules/boot-grub.nix
      ];
    };
    nixosConfigurations.macbook = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./hardware/macbook-pro.nix
        ./modules/desktop.nix
        ./modules/boot-systemd.nix
        ./modules/laptop-configuration.nix
        ./modules/keyd.nix
      ];
    };
  };
}
