# Mac Book Air 2012 (Intel Mac)のセットアップ

nixのNeovimが古いのでMacPortsを入れる

---bash
sudo port install neovim
---


ビルドのコマンド

---bash
sudo -H darwin-rebuild switch \
  --flake ~/dotfiles/nix#macbook-air-2012
---
