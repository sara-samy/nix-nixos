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
    plugins = [
      {
        name = "zsh-autosuggestions";
	src = pkgs.fetchFromGitHub {
	  owner = "zsh-users";
	  repo = "zsh-autosuggestions";
	  rev = "v0.7.0";
	  hash = "sha256-KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
	};
      }
      {
        name = "zsh-vi-mode";
	src = pkgs.fetchFromGitHub {
	  owner = "zsh-users";
	  repo = "zsh-vi-mode";
	  rev = "v0.11.0";
	  hash = "sha256-xbchXJTFWeABTwq6h4KWLh+EvydDrDzcY9AQVK65RS8=";
        };
      }
    ];
    shellAliases = import ./aliases.nix {inherit pkgs lib config;};
  };
}
