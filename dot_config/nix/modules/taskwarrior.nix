{ config, pkgs, ... } :
{
  environment.systemPackages = with pkgs; [
     taskwarrior3
     taskwarrior-tui
  ];

  systemd.timers."task-sync" = {
    wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = "5m";
        OnUnitActiveSec = "5m";
        Unit = "task-sync.service";
      };
  };

  systemd.services."task-sync" = {
    script = ''
      ${pkgs.taskwarrior3}/bin/task sync
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "jack";
    };
  };
}
