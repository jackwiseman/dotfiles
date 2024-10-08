# extras needed for a full-fledged desktop
{ config, pkgs, ... }:
let
  monaco-nerd-font = pkgs.callPackage ../packages/monaco-nerd-font.nix { inherit pkgs; };
  git-credential-1password = pkgs.callPackage ../packages/git-credential-1password/default.nix { };
in
{
  services.xserver = {
    enable = true;

    excludePackages = [ pkgs.xterm ];

    xkb = {
      layout = "us";
      variant = "";
    };

    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  environment.systemPackages = with pkgs; [
    alacritty
    avizo
    git-credential-1password
    libnotify
    libreoffice-qt6-fresh
    libsecret
    lxqt.lxqt-openssh-askpass
    obsidian
    overskride
    pinentry-rofi
    rofi-wayland-unwrapped
    spotify
    swayimg
    vlc
    wl-clipboard
    wpaperd
    nautilus
    zathura
    zoom-us
  ];

  xdg.mime.defaultApplications = {
    "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop";
  };

  fonts = {
    packages = with pkgs; [
      monaco-nerd-font
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [ "Monaco Nerd Font" ];
      };
    };
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs = {
    waybar.enable = true;
    firefox.enable = true;
    _1password.enable = true;
    _1password-gui.enable = true;
    sway = {
      enable = true;
      package = pkgs.swayfx;
    };
  };
}
