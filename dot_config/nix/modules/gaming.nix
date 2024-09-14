# extras needed for a full-fledged desktop
{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    linuxKernel.packages.linux_zen.xone
    mangohud
  ];

  hardware.xone.enable = true;

  programs = {
    steam = {
      enable = true;
      # remotePlay.openFirewall = true;
      # dedicatedServer.openFirewall = true;
      extraCompatPackages = with pkgs; [ proton-ge-bin ];

      gamescopeSession.enable = true;
    };

    gamescope.enable = true;
    gamemode.enable = true;
  };
}
