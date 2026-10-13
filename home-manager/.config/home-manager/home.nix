{ config, pkgs, ... }:

{
  home.username = "soma";
  home.homeDirectory = "/Users/soma";

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    neovim
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
  
  nix.package = pkgs.nix;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
