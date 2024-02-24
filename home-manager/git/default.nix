{config, pkgs, ... }: {
  programs.git = {
    enable = true;
    extraConfig = {
      init = {defaultBranch = "main";};
    };
    includes = [
      { path = ./gitconfig; }
      # { condition = "gitdir:sarasamygitlab/"; path = ./gitconfig-work; }
    ];
    ignores = [
      ".cache/"
      ".DS_Store"
      ".idea/"
      ".vscode"
      ".direnv/"
      "node_modules"
      ".ipynb_checkpoints"
      "__pycache__"
      "*.blend1"
    ];
  };
}
