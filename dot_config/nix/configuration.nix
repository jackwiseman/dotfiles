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
  ];

  virtualisation.docker.enable = true;

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };

  system.stateVersion = "24.05";
}
