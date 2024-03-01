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
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = with pkgs; [
    gh
    fzf
    unzip
    ripgrep
    neofetch
    nurl
    yt-dlp
    ffmpeg
    zsh-powerlevel10k
    fantasque-sans-mono
    (nerdfonts.override { fonts = [ "JetBrainsMono" "Mononoki" ]; })
    (google-fonts.override { fonts = [ "Spectral" ]; })
  ];

  home.file.".p10k.zsh" = {
    source = ./.p10k.zsh;
    executable = true;
  };

  fonts.fontconfig.enable = true;

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
  programs.bat = {
    enable = true;
    config = { color="always";  pager = "less -FR";  theme = "Dracula"; };
  };
}
