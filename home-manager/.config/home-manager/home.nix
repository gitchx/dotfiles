{ pkgs, ... }:

{
  imports = [
    ./common.nix
  ] ++ (
    if pkgs.stdenv.isDarwin
    then [ ./darwin.nix ]
    else [ ./linux.nix ]
  );
}
