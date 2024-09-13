# extras needed for a full-fledged desktop
{ config, pkgs, ... }:
let
  monaco-nerd-font = pkgs.callPackage ../packages/monaco-nerd-font.nix { inherit pkgs; };
  git-credential-1password = pkgs.callPackage ../packages/git-credential-1password/default.nix { };
in
{
  services.xserver = {
    enable = true;

    xkb = {
      layout = "us";
      variant = "";
    };

    displayManager.gdm = {
      enable = true;
      wayland = true;
    };

    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = with pkgs; [
    alacritty
    git-credential-1password
    hdrop
    libreoffice-qt6-fresh
    lxqt.lxqt-openssh-askpass
    obsidian
    spotify
    vlc
    wl-clipboard
    pinentry-rofi
    libsecret
    libnotify
    # wofi
    rofi-wayland-unwrapped
    wpaperd
    zathura
  ];

  xdg.mime.defaultApplications = {
    "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop";
  };

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

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs = {
    firefox.enable = true;
    _1password-gui.enable = true;
    hyprland.enable = true;
    hyprlock.enable = true;
    waybar.enable = true;
  };
}
