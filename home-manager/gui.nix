{ pkgs, ... }:

{
  home.packages = with pkgs; [
    zathura
    zotero
    obsidian
    vlc
  ];
}
