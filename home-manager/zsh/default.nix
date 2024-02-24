{ config, lib, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = false;
    syntaxHighlighting = {
      enable = true;
      highlighters = [ "brackets" ];
      styles = {
        comment = "fg=black,bold";
	path = "fg=cyan";
	};
    };
    history = {
      save = 1000;
      size = 1000;
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
    };
    initExtra = ''
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
      '';
    shellAliases = import ./aliases.nix {inherit pkgs lib config;};
    };
}
