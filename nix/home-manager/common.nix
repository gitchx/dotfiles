{ pkgs, ... }:

{
  home.username = "soma";

  home.packages = with pkgs; [
    neovim
    wezterm
    stow
  ] ++ lib.optionals (pkgs ? codex) [
    pkgs.codex
  ];

  programs.home-manager.enable = true;
}
