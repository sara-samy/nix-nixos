{pkgs, ...}: {
  imports = [
    ./gui.nix
    ./gnome.nix
    ./zsh
    ./nvim
    ./git
    ./kitty
  ];

  home.username = "sarasamy";
  home.homeDirectory = "/home/sarasamy";
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.file = {
    "starship.toml" = {
      source = ./starship.toml;
    };
    "zathurarc" = {
      source = ./zathurarc;
    };
  };

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    gh
    fd
    unzip
    xclip
    ripgrep
    pdfgrep
    gnumake
    # display
    figlet
    neofetch
    # nix-related
    nil
    nurl
    alejandra
    # latex
    ghostscript
    texlive.combined.scheme-full
    texlab
    # media
    yt-dlp
    ffmpeg
    imagemagick
    glow
    # python
    poetry
    # fonts
    fantasque-sans-mono
    (nerdfonts.override {fonts = ["JetBrainsMono" "Mononoki" "IosevkaTerm"];})
    (google-fonts.override {fonts = ["Spectral"];})
  ];

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;
  programs.zoxide = {
    enable = true;
    options = ["--cmd cd"];
    enableZshIntegration = true;
  };
  programs.eza = {
    enable = true;
    git = true;
    icons = true;
    extraOptions = ["--icons"];
  };
  programs.bat = {
    enable = true;
    config = {
      color = "always";
      pager = "less -FR";
      theme = "Dracula";
    };
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = pkgs.lib.importTOML ./starship.toml;
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    historyWidgetOptions = ["--sort" "--exact"];
    fileWidgetCommand = "";
  };
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };
}
