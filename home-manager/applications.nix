{ pkgs, ... }:

{
  home.packages = with pkgs; [
    zathura
    obsidian
    vlc
  ];
}
