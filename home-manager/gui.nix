{pkgs, ...}: {
  home.packages = with pkgs; [
    zathura
    texmaker
    lyx
    # study
    zotero
    obsidian
    # media
    vlc
  ];
}
