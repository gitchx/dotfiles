{ ... }:

{
  imports = [
    ../common.nix
  ];

  home.username = "soma";
  home.homeDirectory = "/Users/soma";

  home.stateVersion = "24.11";
}
