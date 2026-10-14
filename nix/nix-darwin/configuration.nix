{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.vim
  ];

  users.users.soma.home = "/Users/soma";

  # Flakesを有効化
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # 既存の設定を維持
  system.stateVersion = 6;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
