# small things needed on the macbook pro 13,3
{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brightnessctl
  ];

  # not ideal, but cant figure out a graceful way to sleep currently
  services.logind = {
    # extraConfig = "HandlePowerKey=poweroff";
    lidSwitch = "ignore";
  };

}
