{ config, pkgs, ... }:
{
  networking.networkmanager.enable = true;

  time.timeZone = "America/Los_Angeles";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;
    users.jack = {
      isNormalUser = true;
      description = "jack";
      extraGroups = [ "networkmanager" "wheel" "uinput" "docker" ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICHVGCExjxSPKletSqxBsgoYvLdP4IcaK6ZEajjrESTI"
      ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  programs.ssh = {
    enableAskPassword = true;
    askPassword = "${pkgs.lxqt.lxqt-openssh-askpass}/bin/lxqt-openssh-askpass";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = false;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
     chezmoi
     delta
     fnm
     fzf
     gcc
     git
     gnumake
     go
     jq
     killall
     lazygit
     lf
     neovim
     nodejs_22
     ripgrep
     tmux
     xcape
     zoxide


    # dive # look into docker image layers
    # podman-tui # status of containers in the terminal
    # docker-compose # start group of containers for dev
    podman-compose # start group of containers for dev
  ];

# virtualisation.docker.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };

  system.stateVersion = "24.05";
}
