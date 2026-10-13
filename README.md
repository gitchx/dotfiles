# 設定ファイルをまとめています

## symlink farm managerのGNU Stowを使ってNeovimなどの設定をコピーできます

ホームディレクトリにdotfilesリポジトリをクローンします

---bash
cd ~
git clone https://github.com/gitchx/dotfiles.git
---

Stowでシンポリックリンクを作成します。
※ コピー先のディレクトリはバックアップしてください

---bash
cd ~/dotfiles
stow -t ~ nvim
---
