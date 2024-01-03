If you are using NixOS then here are some requirements:

1. If you are using hyprland then it's require to enable `xserver` and `polkit` to make it possible to work with xwayland option.

```nix
services.xserver.enable = true;
security.polkit.enable = true;
```

2. To change shell of an user you must enable zsh on system level even though use have enabled it in home-manager.

To enable zsh system-wide
```nix
programs.zsh.enable = true;
```

To change shell of an user
```nix
users.users.duc = {
  # ...
  # other configurations
  # ...
  shell = pkgs.zsh;
};
```

3. To add fonts

```nix
fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ]; })
];
```