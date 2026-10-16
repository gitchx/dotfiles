{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.vim
  ];

  users.users.soma.home = "/Users/soma";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = 5;

  # Intel Mac
  nixpkgs.hostPlatform = "x86_64-darwin";
}
