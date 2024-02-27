{ config, pkgs, lib, ... }: {
  programs.kitty = {
    enable = true;
    theme = "Adventure Time";
    font = {
      name = "Mononoki";
      size = 12.0;
    };
    keybindings = {
      "cmd+c" = "copy_to_clipboard";
      "cmd+v" = "paste_from_clipboard";
      "cmd+t" = "new_tab";
      "cmd+w" = "close_tab";
      "cmd+enter" = "new_window";
      "shift+cmd+w" = "close_os_window";
    };
    extraConfig = builtins.readFile ./kitty.conf;
    shellIntegration = {
      enableZshIntegration = true;
    };        
  };
}
