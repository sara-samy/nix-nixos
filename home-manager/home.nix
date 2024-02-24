{ config, pkgs, ... }: {
  imports = [
    ./gui.nix
    ./zsh
    ./nvim
    ./git
    ./kitty
  ]; 

  home.stateVersion = "23.11"; # Don't edit.

  home.username = "sarasamy";
  home.homeDirectory = "/home/sarasamy";

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    neofetch
    unzip
    gh
    bat
    yt-dlp
    ffmpeg
    fantasque-sans-mono
    (nerdfonts.override { fonts = [ "JetBrainsMono" "Mononoki" ]; })
  ];

  programs.home-manager.enable = true;
  programs.zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
      enableZshIntegration = true;
  };
  programs.eza = {
      enable = true;
      git = true;
      icons = true;
      enableAliases = true;
      extraOptions = [ "--icons" ];
    };
}
