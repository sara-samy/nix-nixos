{ config, pkgs, lib, ... }:
  with lib;
  with pkgs; {
    cat = "${getExe bat} --style=plain";
    tree = "${getExe eza} --tree --icons --tree";
    rebuild-os = "sudo nixos-rebuild switch --flake $HOME/nixos-config/flake.nix#nixos";
    yt-mp3 = ''
      ${getExe yt-dlp} -x --continue --add-metadata --embed-thumbnail --audio-format mp3 --audio-quality 0 --metadata-from-title="%(artist)s - %(title)s" --prefer-ffmpeg -o "%(title)s.%(ext)s"'';
}
