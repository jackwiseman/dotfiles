# extras needed for a full-fledged desktop
{ config, pkgs, ... }:

{
  boot.initrd.kernelModules = ["amdgpu"];

  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];

    xkb = {
      layout = "us";
      variant = "";
    };

    displayManager.gdm = {
      enable = true;
      wayland = true;
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
    waybar.enable = true;
  };

  environment.sessionVariables = { WLR_DRM_DEVICES = "/dev/dri/card0"; }; #if this isn't set, hyprland doesn't know which gpu to use
}
