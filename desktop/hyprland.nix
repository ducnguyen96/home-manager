{
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    # Whether to enable Hyprland wayland compositor
    enable = true;
    # The hyprland package to use
    package = pkgs.hyprland;
    # Whether to enable Xwayland;
    xwayland.enable = true;

    # Optional
    # Whether to enable hyprland-session.target on hyprland startup
    systemd.enable = true;
    # Whether to enable patching wlroots for better Nvidia support
    enableNvidiaPatches = false;

    settings = {
      decoration = {
        shadow_offset = "0 5";
        "col.shadow" = "rgba(00000099)";
      };

      # monitors
      monitor = [
        ",highres,auto,1"
        "DP-1, 2560x1080@144, 0x0, 1, bitdepth, 10"
      ];

      # workspaces
      workspace = [
        "DP-2,1"
        "DP-2,3"
        "DP-2,5"
        "DP-2,7"
        "DP-2,9"
        "HDMI-A-1,2"
        "HDMI-A-1,4"
        "HDMI-A-1,6"
        "HDMI-A-1,8"
        "HDMI-A-1,0"
      ];

      # modifer
      "$mod" = "SUPER";

      # assign apps
      "$term" = "kitty";
      "$browser" = "firefox";

      bindm = [
        # mouse movements
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];

      binde = [
        # Resize windows
        "$mod SHIFT, right, resizeactive, 10 0"
        "$mod SHIFT, left, resizeactive, -10 0"
        "$mod SHIFT, up, resizeactive, 0 -10"
        "$mod SHIFT, down, resizeactive, 0 10"

        # Resize windows vim keys"
        "$mod SHIFT, l, resizeactive, 10 0"
        "$mod SHIFT, h, resizeactive, -10 0"
        "$mod SHIFT, j, resizeactive, 0 -10"
        "$mod SHIFT, k, resizeactive, 0 10"
      ];

      bind = [
        # Window/session actions
        "$mod, Q, exec, hyprctl dispatch killactive"
        "$mod, delete, exit"
        "$mod, F, fullscreen"
        "$mod SHIFT, F, togglefloating"
        "$mod, tab, exec, hyprctl dispatch focuscurrentorlast"

        # Application shortcuts
        "$mod, return, exec, kitty"
        "$mod, D, exec, pkill -x rofi || rofi -show drun"

        # Move focus with mod + arrow keys
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, j, movefocus, u"
        "$mod, k, movefocus, d"
        "ALT, Tab, movefocus, d"

        # Switch workspaces with mod + [0-9]
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move active window to a workspace with mod + SHIFT + [0-9]
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
      ];
    };
  };
}