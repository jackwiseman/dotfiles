# small things needed on the macbook pro 13,3
{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brightnessctl
  ];
}
