{ pkgs, ... }:

{
  imports = [
    ../common.nix
  ];

  home.homeDirectory = "/Users/soma";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
