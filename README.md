## Installation
On fresh nixos or linux distros with nix installed

1. Install [home manager](https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone)
```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager

nix-channel --update

nix-shell '<home-manager>' -A install
```

2. Replace your home manager config with any config in this repo.

```bash
nix-shell -p git
rm -rf ~/.config/home-manager
git clone --depth=1 --branch=master https://github.com/ducnguyen96/home-manager ~/.config
```

3. Switch

```bash
# you need to exit your shell then login to use home-manager
home-manager switch
```

## Usage
1. To use hyprland

```bash
Hyprland
```

## How to:

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

4. Setting up Xorg system-wide but without a Display Manager

`/etc/nixos/configuration.nix`
```nix
services.xserver.displayManager.startx.enable = true;
```