{ config, ... }:
{
  fileSystems."/nas" = {
    device = "192.168.1.115:/mnt/casino/downloads";
    fsType = "nfs";

    options = [ "x-systemd.idle-timeout=600" ];
  };
}
