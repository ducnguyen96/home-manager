{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    # Whether to enable Hyprland wayland compositor
    enable = true;
    # The hyprland package to use
    package = pkgs.hyprland;
    # Whether to enable Xwayland;
    xwayland.enable = true;

    # Optional
    # Whether to enable hyprland-session.target on hyprland startup
    systemd.enable = false;
    # Whether to enable patching wlroots for better Nvidia support
    enableNvidiaPatches = false;
  };

  home.file."/home/${config.home.username}/.config/hypr" = {
    source = "/home/${config.home.username}/.config/home-manager/wm/hyprland/hypr";
  };
}
