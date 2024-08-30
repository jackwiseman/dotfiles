{
  description = "flake for jackOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }@inputs: {
    nixosConfigurations.jackOS = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        ./modules/desktop.nix
        ./modules/gaming.nix
        ./modules/gpu-passthrough.nix
      ];
    };
    nixosConfigurations.macbook = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hardware/macbook-pro.nix
        ./modules/desktop.nix
        ./configuration.nix
      ];
    };
  };
}
