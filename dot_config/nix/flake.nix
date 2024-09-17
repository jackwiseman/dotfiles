{
  description = "flake for jackOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {self, nixpkgs, ...}@inputs: {
    nixosConfigurations = {

      # proxmox vm with gpu passthrough
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./hardware/proxmox-desktop.nix
          ./modules/desktop.nix
          ./modules/gaming.nix
          ./modules/gpu-passthrough.nix
          ./modules/boot-grub.nix
          ./modules/taskwarrior.nix
          ./modules/nas-nfs.nix
          { networking.hostName = "jackOS"; }
        ];
      };

      # macbook pro 13,3 dual booting monterey + nix
      macbook = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./hardware/macbook-pro.nix
          ./modules/desktop.nix
          ./modules/boot-systemd.nix
          ./modules/laptop-configuration.nix
          ./modules/keyd.nix
          ./modules/taskwarrior.nix
          ./modules/nas-nfs.nix
          { networking.hostName = "nixbook-pro"; }
        ];
      };

      # gitea container deployment target
      mario = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
	  ./hardware/mario.nix
          ./configuration.nix
          ./modules/boot-grub.nix
          { networking.hostName = "mario-nix"; }
        ];
      };
    };
  };
}
