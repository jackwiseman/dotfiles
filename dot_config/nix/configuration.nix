{ config, pkgs, ... }:
let
  monaco-nerd-font = pkgs.callPackage ./packages/monaco-nerd-font.nix { inherit pkgs; };
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./desktop.nix
    ];



  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "jackOS"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # hardware.bluetooth.enable = true;
  # hardware.bluetooth.powerOnBoot = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;
    users.jack = {
      isNormalUser = true;
      description = "jack";
      extraGroups = [ "networkmanager" "wheel" "uinput" "docker" ];
      packages = with pkgs; [
      #  thunderbird
      ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICHVGCExjxSPKletSqxBsgoYvLdP4IcaK6ZEajjrESTI"
      ];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.zsh = {
    enable = true;
    enableCompletion = false;
  };

  programs._1password = { enable = true; };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
     alacritty
     chezmoi
     delta
     fnm
     fzf
     gcc
     git
     go
     hdrop
     killall
     lazygit
     lf
     neovim
     nodejs_22
     ripgrep
     spotify
     taskwarrior3
     tmux
     vlc
     wl-clipboard
     wofi
     wpaperd
     zoxide
  ];

  virtualisation.docker.enable = true;

  fonts = {
    packages = with pkgs; [
      monaco-nerd-font
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [ "Monaco Nerd Font" ];
      };
    };
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };

  services.kanata = {
    enable = false;
    keyboards = {
      internalKeyboard = {
        config = ''
          (defsrc
           caps
          )

          (defalias
           escctrl (tap-hold 100 100 esc lctrl)
          )

          (deflayer base
           @escctrl
          )
        '';
      };
    };
  };

  system.stateVersion = "24.05"; # Did you read the comment?
}
