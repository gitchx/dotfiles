{ pkgs, ... }:

{
  home.username = "soma";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    neovim
    wezterm
  ];

  programs.home-manager.enable = true;
}
