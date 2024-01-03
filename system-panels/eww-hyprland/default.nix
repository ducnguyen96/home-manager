{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ 
    eww-wayland

    # dependecies
    socat
    gawk
    jq
    killall
  ];

  home.file."/home/${config.home.username}/.config/eww" = {
    source = "/home/${config.home.username}/.config/home-manager/system-panels/eww-hyprland/eww";
  };
}