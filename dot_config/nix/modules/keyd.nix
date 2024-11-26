# extras needed for a full-fledged desktop
{ config, pkgs, ... }:
{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            capslock = "overload(control, esc)";
            esc = "capslock";
            leftmeta = "layer(cmd)";
          };
          cmd = {
            c = "C-c";
            v = "C-v";
            x = "C-x";
            t = "C-t";
            left = "home";
            right = "end";
            space = "M-space";
          };
        };
      };
    };
  };
}
