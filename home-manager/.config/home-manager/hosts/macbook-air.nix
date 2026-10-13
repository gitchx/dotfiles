{ pkgs, ... }:

{
  imports = [
    ../common.nix
  ];

  home.homeDirectory = "/Users/soma";

  nix.package = pkgs.nix;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
