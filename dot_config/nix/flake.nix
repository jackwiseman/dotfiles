{
  description = "flake for jackOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "git+https://github.com/hyprwm/hyprland?submodules=1";
  };

  outputs = {nixpkgs, ...}@inputs: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;}; # https://github.com/sp1ritCS/hyprland-wiki/blob/359501de89a4187369d6f3ab379302299d2fd373/pages/Nix/Hyprland%20on%20NixOS.md?plain=1#L34
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
      specialArgs = {inherit inputs;}; # https://github.com/sp1ritCS/hyprland-wiki/blob/359501de89a4187369d6f3ab379302299d2fd373/pages/Nix/Hyprland%20on%20NixOS.md?plain=1#L34
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
