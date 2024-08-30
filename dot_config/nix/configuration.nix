{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/desktop.nix
     # ./modules/gpu-passthrough.nix
     # ./modules/gaming.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # boot.loader.grub = {
  #  enable = true;
  #  device = "/dev/sda";
  #  useOSProber = true;
  # };

  networking = {
    hostName = "jackOS";
    networkmanager.enable = true;
  };

  time.timeZone = "America/Los_Angeles";

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

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

  programs.ssh = {
    enableAskPassword = true;
    askPassword = "${pkgs.lxqt.lxqt-openssh-askpass}/bin/lxqt-openssh-askpass";
  };

  # home.sessionVariables = {
  #   SSH_ASKPASS = "${pkgs.lxqt.lxqt-openssh-askpass}/bin/lxqt-openssh-askpass";
  # };

  programs.zsh = {
    enable = true;
    enableCompletion = false;
  };

  programs._1password = { enable = true; };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.keyd = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
     chezmoi
     delta
     fnm
     fzf
     gcc
     git
     go
     jq
     killall
     lazygit
     lf
     neovim
     nodejs_22
     ripgrep
     taskwarrior3
     taskwarrior-tui
     tmux
     xcape
     zoxide
  ];

  systemd.timers."task-sync" = {
    wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = "5m";
        OnUnitActiveSec = "5m";
        Unit = "task-sync.service";
      };
  };

  systemd.services."task-sync" = {
    script = ''
      ${pkgs.taskwarrior3}/bin/task sync
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "jack";
    };
  };

  virtualisation.docker.enable = true;

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
