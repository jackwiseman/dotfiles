{ config, pkgs, ... }: # imports can be smaller
{
  boot.loader.grub = {
   enable = true;
   device = "/dev/sda";
   useOSProber = true;
  };
}
