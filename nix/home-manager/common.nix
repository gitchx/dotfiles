{ pkgs, ... }:

{
  home.username = "soma";

  home.packages = with pkgs; [
    wezterm
    stow
    gh
  ] ++ lib.optionals (pkgs ? codex) [
    pkgs.codex
  ];

  programs.home-manager.enable = true;
}
