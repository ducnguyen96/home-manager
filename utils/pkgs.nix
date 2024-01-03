{ lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    pulsemixer
    neofetch
    htop
  ];
}