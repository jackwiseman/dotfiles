{ config, pkgs, ... }: # imports can be smaller
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
