{ pkgs, lib, ... }:

{
  config = lib.mkIf pkgs.stdenv.isDarwin {
    home.homeDirectory = "/Users/soma";

    nix.package = pkgs.nix;

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
