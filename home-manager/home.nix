{ config, pkgs, ... }:

{
  home.username = "sarasamy";
  home.homeDirectory = "/home/sarasamy";

  # You can update Home Manager without changing this value.
  home.stateVersion = "23.11"; # Read Comment above.

  # Enable font configuration.
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    neofetch
    bat
    htop
    tree
  ];

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      extraConfig = {
        init.defaultBranch = "main";
      };
      includes = [
         { path = ../dotfiles/gitconfig; }
      ];
    };
    neovim = {
      enable = true;
    };
    gh = {
      enable = true;
    };
  };
}
