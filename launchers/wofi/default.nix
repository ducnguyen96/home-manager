{ config, ... }:

{
  programs.wofi = {
    enable = true;
  };

  home.file."/home/${config.home.username}/.config/wofi" = {
    source = "/home/${config.home.username}/.config/home-manager/launchers/wofi/wofi";
  };
}