{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gitea-actions-runner
  ];

  systemd.services.actrunner = {
    script = ''
      /run/current-system/sw/bin/act_runner daemon &
    '';
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      RuntimeDirectory = "actrunner";
      WorkingDirectory = "/home/jack/actrunner";
      Type = "oneshot";
      RemainAfterExit = true;
    };
  };
}
