{ config, pkgs, lib, ... }:
  with lib;
  with pkgs; {
    cat = "${getExe bat} --style=plain";
    tree = "${getExe eza} --tree --icons --tree";
    rebuild-os = "sudo nixos-rebuild switch --flake $HOME/nix-nixos/flake.nix#nixos";
    rollback-once = "sudo nixos-rebuild --rollback switch --flake $HOME/nix-nixos/flake.nix#nixos";
    yt-mp3 = ''
      ${getExe yt-dlp} -x --continue --add-metadata --embed-thumbnail --audio-format mp3 --audio-quality 0 --metadata-from-title="%(artist)s - %(title)s" --prefer-ffmpeg -o "%(title)s.%(ext)s"'';

    # my notes
    man-git = "${getExe bat} $HOME/Downloads/lab/notes/dev-notes/man/git.md";
    man-vim = "${getExe bat} $HOME/Downloads/lab/notes/dev-notes/man/nvim.md";
}
