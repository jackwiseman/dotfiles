# tweaks for passing through a single amd card via proxmox
{ config, pkgs, ... }:
{
  boot.initrd.kernelModules = ["amdgpu"];

  services.xserver.videoDrivers = [ "amdgpu" ];

  environment.sessionVariables = { WLR_DRM_DEVICES = "/dev/dri/card0"; }; #if this isn't set, hyprland doesn't know which gpu to use
}
