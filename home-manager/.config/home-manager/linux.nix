{ pkgs, lib, ... }:

{
  config = lib.mkIf pkgs.stdenv.isLinux {
    home.homeDirectory = "/home/soma";
  };
}
