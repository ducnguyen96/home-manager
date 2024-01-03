{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
  };

  home.file."/home/${config.home.username}/.config/kitty" = {
    source = "/home/${config.home.username}/.config/home-manager/terminals/kitty/kitty";
  };
}