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

            # wip mac style keybindings
            # only issue is cmd + space for spotlight vs autocomplete in zsh
            # leftmeta = "rightcontrol"
          };
        };
      };
    };
  };
}
