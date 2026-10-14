{ pkgs, ... }:

{
  imports = [
    ../common.nix
  ];

  home.homeDirectory = "/Users/soma";

  targets.darwin.copyApps = {
    enable = true;
    # Home Manager syncs this directory, so keep it separate from other apps.
    directory = "/Applications/Home Manager Apps";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
