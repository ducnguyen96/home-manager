{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ 
    # dependecies
    killall
  ];

  programs.waybar = {
    enable = true;
  };

  home.file."/home/${config.home.username}/.config/waybar" = {
    source = "/home/${config.home.username}/.config/home-manager/system-panels/waybar/waybar";
  };
}