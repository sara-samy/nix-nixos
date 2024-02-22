{ config, pkgs, ... }:

{
  imports = [
    ./applications.nix
  ]; 

  home.username = "sarasamy";
  home.homeDirectory = "/home/sarasamy";

  # You can update Home Manager without changing this value.
  home.stateVersion = "23.11"; # Read Comment above.

  # Enable font configuration.
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    neofetch
    htop
    tree
    unzip
    gh
    bat
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
    zsh = {
      enable = true;
      shellAliases = {
        cd = "z";
	man-git = "bat $HOME/lab/notes/man-pages/git.md";
	man-nvim = "bat $HOME/lab/notes/man-pages/nvim.md";
        update-os = "sudo nixos-rebuild switch --flake $HOME/nixos-config/flake.nix#nixos";
      };
      history = {
        size = 10000;
	path = "${config.xdg.dataHome}/zsh/zsh_history";
      };
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    eza = {
      enable = true;
      git = true;
      icons = true;
      extraOptions = [
        "--icons"
	];
    };
    neovim = {
      enable = true;
    };
  };
}
